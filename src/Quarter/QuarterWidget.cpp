/**************************************************************************\
 *
 *  This file is part of the SIM Quarter extension library for Coin.
 *  Copyright (C) 1998-2008 by Systems in Motion.  All rights reserved.
 *
 *  This library is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License ("GPL") version 2
 *  as published by the Free Software Foundation.  See the file COPYING
 *  at the root directory of this source distribution for additional
 *  information about the GNU GPL.
 *
 *  For using SIM Quarter with software that can not be combined with
 *  the GNU GPL, and for taking advantage of the additional benefits of
 *  our support services, please contact Systems in Motion about acquiring
 *  a Coin Professional Edition License.
 *
 *  See <URL:http://www.coin3d.org/> for more information.
 *
 *  Systems in Motion AS, Bygdøy allé 5, N-0257 Oslo, NORWAY. (www.sim.no)
 *
\**************************************************************************/

/*!
  \class SIM::Coin3D::Quarter::QuarterWidget QuarterWidget.h Quarter/QuarterWidget.h

  \brief The QuarterWidget class is the main class in Quarter. It
  provides a widget for Coin rendering. It provides scenegraph
  management and event handling.
*/

#include <assert.h>

#include <Inventor/SbViewportRegion.h>
#include <Inventor/system/gl.h>
#include <Inventor/events/SoEvents.h>
#include <Inventor/nodes/SoNode.h>
#include <Inventor/nodes/SoCamera.h>
#include <Inventor/nodes/SoSeparator.h>
#include <Inventor/nodes/SoDirectionalLight.h>
#include <Inventor/nodes/SoPerspectiveCamera.h>
#include <Inventor/SbColor.h>

#include <Inventor/SoSceneManager.h>
#include <Inventor/SoRenderManager.h>
#include <Inventor/SoEventManager.h>
#include <Inventor/scxml/ScXML.h>
#include <Inventor/scxml/SoScXMLStateMachine.h>
#include <Inventor/navigation/SoNavigationSystem.h>

#include <Quarter/QuarterWidget.h>
#include <Quarter/devices/DeviceManager.h>
#include <Quarter/devices/MouseHandler.h>
#include <Quarter/devices/KeyboardHandler.h>
#include <Quarter/eventhandlers/EventManager.h>
#include <Quarter/eventhandlers/DragDropHandler.h>

#include "ContextMenu.h"
#include "QuarterWidgetP.h"

using namespace SIM::Coin3D::Quarter;

#define PRIVATE(obj) obj->pimpl

/*! constructor */
QuarterWidget::QuarterWidget(QWidget * parent, const QGLWidget * sharewidget, Qt::WindowFlags f)
  : inherited(parent, sharewidget, f)
{
  this->constructor(sharewidget);
}

/*! constructor */
QuarterWidget::QuarterWidget(QGLContext * context, QWidget * parent, const QGLWidget * sharewidget, Qt::WindowFlags f)
  : inherited(context, parent, sharewidget, f)
{
  this->constructor(sharewidget);
}

void
QuarterWidget::constructor(const QGLWidget * sharewidget)
{
  PRIVATE(this) = new QuarterWidgetP(this, sharewidget);

  PRIVATE(this)->scene = NULL;
  PRIVATE(this)->contextmenu = NULL;
  PRIVATE(this)->contextmenuenabled = true;

  PRIVATE(this)->sorendermanager = new SoRenderManager;
  PRIVATE(this)->soeventmanager = new SoEventManager;

  //Mind the order of initialization as the XML state machine uses
  //callbacks which depends on other state being initialized
  PRIVATE(this)->eventmanager = new EventManager(this);
  PRIVATE(this)->devicemanager = new DeviceManager(this);

  ScXMLStateMachine * statemachine =
    ScXML::readFile("coin:scxml/navigation/examiner.xml");
  if (statemachine &&
      statemachine->isOfType(SoScXMLStateMachine::getClassTypeId())) {
    SoScXMLStateMachine * sostatemachine =
      static_cast<SoScXMLStateMachine *>(statemachine);
    statemachine->addStateChangeCallback(QuarterWidgetP::statechangecb, PRIVATE(this));
    PRIVATE(this)->soeventmanager->setNavigationSystem(NULL);
    PRIVATE(this)->soeventmanager->addSoScXMLStateMachine(sostatemachine);
    sostatemachine->initialize();
  }
  PRIVATE(this)->headlight = new SoDirectionalLight;
  PRIVATE(this)->headlight->ref();

  PRIVATE(this)->sorendermanager->setAutoClipping(SoRenderManager::VARIABLE_NEAR_PLANE);
  PRIVATE(this)->sorendermanager->setRenderCallback(QuarterWidget::renderCB, this);
  PRIVATE(this)->sorendermanager->setBackgroundColor(SbColor4f(0.0f, 0.0f, 0.0f, 0.0f));
  PRIVATE(this)->sorendermanager->activate();
  PRIVATE(this)->sorendermanager->addPreRenderCallback(QuarterWidgetP::prerendercb, PRIVATE(this));
  PRIVATE(this)->sorendermanager->addPostRenderCallback(QuarterWidgetP::postrendercb, PRIVATE(this));

  PRIVATE(this)->soeventmanager->setNavigationState(SoEventManager::MIXED_NAVIGATION);

  PRIVATE(this)->devicemanager->registerDevice(new MouseHandler);
  PRIVATE(this)->devicemanager->registerDevice(new KeyboardHandler);
  PRIVATE(this)->eventmanager->registerEventHandler(new DragDropHandler);

  // set up a cache context for the default SoGLRenderAction
  PRIVATE(this)->sorendermanager->getGLRenderAction()->setCacheContext(this->getCacheContextId());

  // set up default cursors for the examiner navigation states
  this->setStateCursor("interact", Qt::ArrowCursor);
  this->setStateCursor("idle", Qt::OpenHandCursor);
  this->setStateCursor("rotate", Qt::ClosedHandCursor);
  this->setStateCursor("pan", Qt::SizeAllCursor);
  this->setStateCursor("zoom", Qt::SizeVerCursor);
  this->setStateCursor("seek", Qt::CrossCursor);
  this->setStateCursor("spin", Qt::OpenHandCursor);

  this->setMouseTracking(TRUE);

  // set focus policy to Strong by default
  this->setFocusPolicy(Qt::StrongFocus);
}

/*! destructor */
QuarterWidget::~QuarterWidget()
{
  PRIVATE(this)->headlight->unref();
  this->setSceneGraph(NULL);
  delete PRIVATE(this)->sorendermanager;
  delete PRIVATE(this)->soeventmanager;
  delete PRIVATE(this)->eventmanager;
  delete PRIVATE(this)->devicemanager;
  delete PRIVATE(this);
}

/*!  
  You can set the cursor you want to use for a given navigation
  state. See the Coin documentation on navigation for information
  about available states
 */
void 
QuarterWidget::setStateCursor(const SbName & state, const QCursor & cursor)
{
  // will overwrite the value of an existing item
  QuarterWidgetP::statecursormap->insert(state, cursor);
}

/*!
  Enable/disable the headlight. This wille toggle the SoDirectionalLigh::on
  field (returned from getHeadlight()).
*/
void
QuarterWidget::enableHeadlight(const SbBool onoff)
{
  PRIVATE(this)->headlight->on = onoff;
}

/*!
  Returns the light used for the headlight.
*/
SoDirectionalLight *
QuarterWidget::getHeadlight(void)
{
  return PRIVATE(this)->headlight;
}

/*!
  Returns the Coin cache context id for this widget.
*/
uint32_t
QuarterWidget::getCacheContextId(void) const
{
  return PRIVATE(this)->getCacheContextId();
}

/*!
  This method sets the transparency type to be used for the scene.
*/
void
QuarterWidget::setTransparencyType(SoGLRenderAction::TransparencyType type)
{
  assert(PRIVATE(this)->sorendermanager);
  PRIVATE(this)->sorendermanager->getGLRenderAction()->setTransparencyType(type);
  PRIVATE(this)->sorendermanager->scheduleRedraw();
}

/*!
  Sets the Inventor scenegraph to be rendered
 */
void
QuarterWidget::setSceneGraph(SoNode * node)
{
  if (node == PRIVATE(this)->scene) {
    return;
  }

  if (PRIVATE(this)->scene) {
    PRIVATE(this)->scene->unref();
    PRIVATE(this)->scene = NULL;
  }

  SoCamera * camera = NULL;
  SoSeparator * superscene = NULL;
  SbBool viewall = FALSE;

  if (node) {
    node->ref();

    PRIVATE(this)->scene = node;
    PRIVATE(this)->scene->ref();

    superscene = new SoSeparator;
    superscene->addChild(PRIVATE(this)->headlight);

    // if the scene does not contain a camera, add one
    if (!(camera = PRIVATE(this)->searchForCamera(node))) {
      camera = new SoPerspectiveCamera;
      superscene->addChild(camera);
      viewall = TRUE;
    }

    superscene->addChild(node);
    node->unref();
  }

  PRIVATE(this)->soeventmanager->setSceneGraph(superscene);
  PRIVATE(this)->sorendermanager->setSceneGraph(superscene);
  PRIVATE(this)->soeventmanager->setCamera(camera);
  PRIVATE(this)->sorendermanager->setCamera(camera);

  if (viewall) { this->viewAll(); }
  if (superscene) { superscene->touch(); }
}

/*!
  Returns pointer to root of scene graph
*/
SoNode *
QuarterWidget::getSceneGraph(void) const
{
  return PRIVATE(this)->scene;
}

/*!
  Returns a pointer to the device manager
 */
DeviceManager *
QuarterWidget::getDeviceManager(void) const
{
  return PRIVATE(this)->devicemanager;
}

/*!
  Returns a pointer to the event manager
 */
EventManager *
QuarterWidget::getEventManager(void) const
{
  return PRIVATE(this)->eventmanager;
}

/*!
  Set the render manager for the widget.
*/
void
QuarterWidget::setSoRenderManager(SoRenderManager * manager)
{
  // FIXME: free existing manager if it is the default one
  PRIVATE(this)->sorendermanager = manager;
}

/*!
  Returns a pointer to the render manager
*/
SoRenderManager *
QuarterWidget::getSoRenderManager(void) const
{
  return PRIVATE(this)->sorendermanager;
}

/*!
  Set the Coin event manager for the widget.
*/
void
QuarterWidget::setSoEventManager(SoEventManager * manager)
{
  // FIXME: free existing manager if it is the default one
  PRIVATE(this)->soeventmanager = manager;
}

/*!
  Returns a pointer to the event manager
*/
SoEventManager *
QuarterWidget::getSoEventManager(void) const
{
  return PRIVATE(this)->soeventmanager;
}

/*!
  Reposition the current camera to display the entire scene
 */
void
QuarterWidget::viewAll(void)
{
  if (PRIVATE(this)->soeventmanager->getNavigationSystem()) {
    PRIVATE(this)->soeventmanager->getNavigationSystem()->viewAll();
  }
  const SbName viewallevent("sim.coin3d.coin.navigation.ViewAll");
  for (int c = 0; c < PRIVATE(this)->soeventmanager->getNumSoScXMLStateMachines(); ++c) {
    SoScXMLStateMachine * sostatemachine =
      PRIVATE(this)->soeventmanager->getSoScXMLStateMachine(c);
    if (sostatemachine->isActive()) {
      sostatemachine->queueEvent(viewallevent);
      sostatemachine->processEventQueue();
    }
  }
}

/*!
  Overridden from QGLWidget to enable OpenGL depth buffer
 */
void
QuarterWidget::initializeGL(void)
{
  glEnable(GL_DEPTH_TEST);
}

/*!
  Overridden from QGLWidget to resize the Coin scenegraph
 */
void
QuarterWidget::resizeGL(int width, int height)
{
  SbViewportRegion vp(width, height);
  PRIVATE(this)->sorendermanager->setViewportRegion(vp);
  PRIVATE(this)->soeventmanager->setViewportRegion(vp);
}

/*!
  Overridden from QGLWidget to render the scenegraph
 */
void
QuarterWidget::paintGL(void)
{
  // we need to render immediately here, and not do scheduleRedraw()
  // since Qt will swap the GL buffers after calling paintGL().
  this->actualRedraw();
}

/*!
  Overridden from QGLWidget to render the scenegraph
 */
void
QuarterWidget::actualRedraw(void)
{
  PRIVATE(this)->sorendermanager->render(TRUE, TRUE);
}

/*!
  
 */
void
QuarterWidget::renderCB(void * closure, SoRenderManager *)
{
  assert(closure);
  QuarterWidget * thisp = (QuarterWidget *) closure;

  thisp->makeCurrent();
  thisp->actualRedraw();
  if (thisp->doubleBuffer()) {
    thisp->swapBuffers();
  }
  thisp->doneCurrent();
}

/*! Translates Qt Events into Coin events and passes them on to the
  scenemanager for processing. If the event can not be translated or
  processed, it is forwarded to Qt and the method returns false. This
  method could be overridden in a subclass in order to catch events of
  particular interest to the application programmer.
 */
bool
QuarterWidget::event(QEvent * event)
{
  if (PRIVATE(this)->eventmanager->handleEvent(event)) {
    return true;
  }

  const SoEvent * soevent = PRIVATE(this)->devicemanager->translateEvent(event);
  if (soevent && PRIVATE(this)->soeventmanager->processEvent(soevent)) {
    return true;
  }
  return inherited::event(event);
}

/*!
  Set backgroundcolor to a given QColor

  Remember that QColors are given in integers between 0 and 255, as
  opposed to SbColor4f which is in [0 ,1]. The default alpha value for
  a QColor is 255, but you'll probably want to set it to zero before
  using it as an OpenGL clear color.
 */
void 
QuarterWidget::setBackgroundColor(const QColor & color)
{
  SbColor4f bgcolor(SbClamp(color.red()   / 255.0, 0.0, 1.0),
                    SbClamp(color.green() / 255.0, 0.0, 1.0),
                    SbClamp(color.blue()  / 255.0, 0.0, 1.0),
                    SbClamp(color.alpha() / 255.0, 0.0, 1.0));

  PRIVATE(this)->sorendermanager->setBackgroundColor(bgcolor);
}

/*!  
  Returns color used for clearing the rendering area before
  rendering the scene.
 */
QColor
QuarterWidget::getBackgroundColor(void) const
{
  SbColor4f bg = PRIVATE(this)->sorendermanager->getBackgroundColor();

  return QColor(SbClamp(int(bg[0] * 255.0), 0, 255),
                SbClamp(int(bg[1] * 255.0), 0, 255),
                SbClamp(int(bg[2] * 255.0), 0, 255),
                SbClamp(int(bg[3] * 255.0), 0, 255));
}

/*!
  Returns the context menu used by the widget.
 */
QMenu * 
QuarterWidget::getContextMenu(void) const
{
  if (!PRIVATE(this)->contextmenu) {
    PRIVATE(this)->contextmenu = new ContextMenu(this);
  }
  return PRIVATE(this)->contextmenu->getMenu();
}

bool
QuarterWidget::contextMenuEnabled(void) const
{
  return PRIVATE(this)->contextmenuenabled;
}

void
QuarterWidget::enableContextMenu(bool yes)
{
  PRIVATE(this)->contextmenuenabled = yes;
}

#undef PRIVATE
