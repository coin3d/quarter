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

#include <QtCore/QEvent>

#include <Inventor/SbViewportRegion.h>
#include <Inventor/system/gl.h>
#include <Inventor/events/SoEvents.h>
#include <Inventor/nodes/SoNode.h>
#include <Inventor/nodes/SoCamera.h>
#include <Inventor/nodes/SoSeparator.h>
#include <Inventor/nodes/SoDirectionalLight.h>
#include <Inventor/nodes/SoPerspectiveCamera.h>
#include <Inventor/SbColor.h>
#include <Inventor/sensors/SoSensorManager.h>
#include <Inventor/SoDB.h>

#include <Inventor/SoRenderManager.h>
#include <Inventor/SoEventManager.h>
#include <Inventor/scxml/ScXML.h>
#include <Inventor/scxml/SoScXMLStateMachine.h>

#include <Quarter/QuarterWidget.h>
#include <Quarter/eventhandlers/EventFilter.h>
#include <Quarter/eventhandlers/DragDropHandler.h>

#include "ContextMenu.h"
#if 0
#include "InteractionMode.h"
#endif
#include "QuarterWidgetP.h"

using namespace SIM::Coin3D::Quarter;

#define PRIVATE(obj) obj->pimpl

/*! constructor */
QuarterWidget::QuarterWidget(const QGLFormat & format, QWidget * parent, const QGLWidget * sharewidget, Qt::WindowFlags f)
  : inherited(format, parent, sharewidget, f)
{
  this->constructor(sharewidget);
}

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

  PRIVATE(this)->sorendermanager = new SoRenderManager;
  PRIVATE(this)->initialsorendermanager = true;
  PRIVATE(this)->soeventmanager = new SoEventManager;
  PRIVATE(this)->initialsoeventmanager = true;

  //Mind the order of initialization as the XML state machine uses
  //callbacks which depends on other state being initialized
  PRIVATE(this)->eventfilter = new EventFilter(this);
  PRIVATE(this)->dragdrophandler = new DragDropHandler(this);
#if 0
  PRIVATE(this)->interactionmode = new InteractionMode(this);
#endif

  // set up default cursors for the examiner navigation states
  this->setStateCursor("interact", Qt::ArrowCursor);
  this->setStateCursor("idle", Qt::OpenHandCursor);
  this->setStateCursor("rotate", Qt::ClosedHandCursor);
  this->setStateCursor("pan", Qt::SizeAllCursor);
  this->setStateCursor("zoom", Qt::SizeVerCursor);
  this->setStateCursor("seek", Qt::CrossCursor);
  this->setStateCursor("spin", Qt::OpenHandCursor);

  // FIXME: This object appears to never be deleted. kintel 20080730
  ScXMLStateMachine * statemachine =
    ScXML::readFile("coin:scxml/navigation/examiner.xml");
  if (statemachine &&
      statemachine->isOfType(SoScXMLStateMachine::getClassTypeId())) {
    SoScXMLStateMachine * sostatemachine =
      static_cast<SoScXMLStateMachine *>(statemachine);
    statemachine->addStateChangeCallback(QuarterWidgetP::statechangecb, PRIVATE(this));
    PRIVATE(this)->soeventmanager->addSoScXMLStateMachine(sostatemachine);
    sostatemachine->initialize();
  }
  PRIVATE(this)->headlight = new SoDirectionalLight;
  PRIVATE(this)->headlight->ref();

  PRIVATE(this)->sorendermanager->setAutoClipping(SoRenderManager::VARIABLE_NEAR_PLANE);
  PRIVATE(this)->sorendermanager->setRenderCallback(QuarterWidgetP::rendercb, this);
  PRIVATE(this)->sorendermanager->setBackgroundColor(SbColor4f(0.0f, 0.0f, 0.0f, 0.0f));
  PRIVATE(this)->sorendermanager->activate();
  PRIVATE(this)->sorendermanager->addPreRenderCallback(QuarterWidgetP::prerendercb, PRIVATE(this));
  PRIVATE(this)->sorendermanager->addPostRenderCallback(QuarterWidgetP::postrendercb, PRIVATE(this));

  PRIVATE(this)->soeventmanager->setNavigationState(SoEventManager::MIXED_NAVIGATION);

  // set up a cache context for the default SoGLRenderAction
  PRIVATE(this)->sorendermanager->getGLRenderAction()->setCacheContext(this->getCacheContextId());

  this->setMouseTracking(TRUE);

  // Qt::StrongFocus means the widget will accept keyboard focus by
  // both tabbing and clicking
  this->setFocusPolicy(Qt::StrongFocus);

  this->installEventFilter(PRIVATE(this)->eventfilter);
#if 0
  this->installEventFilter(PRIVATE(this)->interactionmode);
#endif
  this->installEventFilter(PRIVATE(this)->dragdrophandler);
}

/*! destructor */
QuarterWidget::~QuarterWidget()
{
  PRIVATE(this)->headlight->unref();
  PRIVATE(this)->headlight = NULL;
  this->setSceneGraph(NULL);
  this->setSoRenderManager(NULL);
  this->setSoEventManager(NULL);
  delete PRIVATE(this)->eventfilter;
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
  assert(QuarterWidgetP::statecursormap);
  // will overwrite the value of an existing item
  QuarterWidgetP::statecursormap->insert(state, cursor);
}

QCursor
QuarterWidget::stateCursor(const SbName & state)
{
  assert(QuarterWidgetP::statecursormap);
  return QuarterWidgetP::statecursormap->value(state);
}

/*!
  Enable/disable the headlight. This wille toggle the SoDirectionalLight::on
  field (returned from getHeadlight()).
*/
void
QuarterWidget::setHeadlightEnabled(bool onoff)
{
  PRIVATE(this)->headlight->on = onoff;
}

/*! 
  Returns true if the headlight is on, false if it is off
 */
bool
QuarterWidget::headlightEnabled(void) const
{
  return PRIVATE(this)->headlight->on.getValue();
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
  Specify if you want the z buffer to be cleared before
  redraw. This is on by default.
*/
void 
QuarterWidget::setClearZBuffer(bool onoff)
{
  PRIVATE(this)->clearzbuffer = onoff;
}

/*! 
  Returns true if the z buffer is cleared before rendering.
*/
bool 
QuarterWidget::clearZBuffer(void) const
{
  return PRIVATE(this)->clearzbuffer;
}

/*!  
  Specify if you want the rendering buffer to be cleared before
  rendering. This is on by default.
 */
void 
QuarterWidget::setClearWindow(bool onoff)
{
  PRIVATE(this)->clearwindow = onoff;
}

/*!  
  Returns true if the rendering buffer is cleared before rendering.
 */
bool 
QuarterWidget::clearWindow(void) const
{
  return PRIVATE(this)->clearwindow;
}

/*!
  Enable/disable interaction mode
 */
void 
QuarterWidget::setInteractionModeEnabled(bool onoff)
{
#if 0
  PRIVATE(this)->interactionmode->setEnabled(onoff);
#endif
}

/*!
  Returns true if interaction mode is enabled, false otherwise.
 */
bool 
QuarterWidget::interactionModeEnabled(void) const
{
#if 0
  return PRIVATE(this)->interactionmode->enabled();
#else
  return false;
#endif
}

/*!
  Turn interaction mode on or off
*/
void 
QuarterWidget::setInteractionModeOn(bool onoff)
{
#if 0
  PRIVATE(this)->interactionmode->setOn(onoff);
#endif
}

/*!
  Returns true if interaction mode is on.
 */
bool 
QuarterWidget::interactionModeOn(void) const
{
#if 0
  return PRIVATE(this)->interactionmode->on();
#else
  return false;
#endif
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
QuarterWidget::setTransparencyType(TransparencyType type)
{
  assert(PRIVATE(this)->sorendermanager);
  PRIVATE(this)->sorendermanager->getGLRenderAction()->setTransparencyType((SoGLRenderAction::TransparencyType)type);
  PRIVATE(this)->sorendermanager->scheduleRedraw();
}

QuarterWidget::TransparencyType 
QuarterWidget::transparencyType(void) const
{
  assert(PRIVATE(this)->sorendermanager);
  SoGLRenderAction * action = PRIVATE(this)->sorendermanager->getGLRenderAction();
  return static_cast<QuarterWidget::TransparencyType>(action->getTransparencyType());
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
  bool viewall = false;

  if (node) {
    PRIVATE(this)->scene = node;
    PRIVATE(this)->scene->ref();

    superscene = new SoSeparator;
    superscene->addChild(PRIVATE(this)->headlight);

    // if the scene does not contain a camera, add one
    if (!(camera = PRIVATE(this)->searchForCamera(node))) {
      camera = new SoPerspectiveCamera;
      superscene->addChild(camera);
      viewall = true;
    }

    superscene->addChild(node);
  }

  PRIVATE(this)->soeventmanager->setCamera(camera);
  PRIVATE(this)->sorendermanager->setCamera(camera);
  PRIVATE(this)->soeventmanager->setSceneGraph(superscene);
  PRIVATE(this)->sorendermanager->setSceneGraph(superscene);

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
  Set the render manager for the widget.
*/
void
QuarterWidget::setSoRenderManager(SoRenderManager * manager)
{
  bool carrydata = false;
  SoNode * scene = NULL;
  SoCamera * camera = NULL;
  SbViewportRegion vp;
  if (PRIVATE(this)->sorendermanager && (manager != NULL)) {
    scene = PRIVATE(this)->sorendermanager->getSceneGraph();
    camera = PRIVATE(this)->sorendermanager->getCamera();
    vp = PRIVATE(this)->sorendermanager->getViewportRegion();
    carrydata = true;
  }
  if (PRIVATE(this)->initialsorendermanager) {
    delete PRIVATE(this)->sorendermanager;
    PRIVATE(this)->initialsorendermanager = false;
  }
  PRIVATE(this)->sorendermanager = manager;
  if (carrydata) {
    PRIVATE(this)->sorendermanager->setSceneGraph(scene);
    PRIVATE(this)->sorendermanager->setCamera(camera);
    PRIVATE(this)->sorendermanager->setViewportRegion(vp);
  }
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
  bool carrydata = false;
  SoNode * scene = NULL;
  SoCamera * camera = NULL;
  SbViewportRegion vp;
  if (PRIVATE(this)->soeventmanager && (manager != NULL)) {
    scene = PRIVATE(this)->soeventmanager->getSceneGraph();
    camera = PRIVATE(this)->soeventmanager->getCamera();
    vp = PRIVATE(this)->soeventmanager->getViewportRegion();
    carrydata = true;
  }
  if (PRIVATE(this)->initialsoeventmanager) {
    delete PRIVATE(this)->soeventmanager;
    PRIVATE(this)->initialsoeventmanager = false;
  }
  PRIVATE(this)->soeventmanager = manager;
  if (carrydata) {
    PRIVATE(this)->soeventmanager->setSceneGraph(scene);
    PRIVATE(this)->soeventmanager->setCamera(camera);
    PRIVATE(this)->soeventmanager->setViewportRegion(vp);
  }
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
  // We need to process the delay queue here since we don't know when
  // paintGL() is called from Qt, and we might have some sensors
  // waiting to trigger (the redraw sensor has a lower priority than a
  // normal field sensor to guarantee that your sensor is processed
  // before the next redraw). Disable autorendering while we do this
  // to avoid recursive redraws.
  PRIVATE(this)->autoredrawenabled = false;
  if (SoDB::getSensorManager()->isDelaySensorPending()) {
    // processing the sensors might trigger a redraw in another
    // context. Release this context temporarily
    this->doneCurrent();
    SoDB::getSensorManager()->processDelayQueue(FALSE);
    this->makeCurrent();
  }
  // we need to render immediately here, and not do scheduleRedraw()
  // since Qt will swap the GL buffers after calling paintGL().
  this->actualRedraw();
  PRIVATE(this)->autoredrawenabled = true;
}

/*!
  Used for rendering the scene. Usually Coin/Quarter will automatically redraw
  the scene graph at regular intervals, after the scene is modified.
 
  However, if you want to disable this functionality and gain full control over
  when the scene is rendered yourself, you can turn off autoredraw in the
  render manager and render the scene by calling this method.
*/
void 
QuarterWidget::redraw(void)
{
  this->makeCurrent();
  this->actualRedraw();
  if (this->doubleBuffer()) {
    this->swapBuffers();
  }
  this->doneCurrent();
}

/*!
  Overridden from QGLWidget to render the scenegraph
 */
void
QuarterWidget::actualRedraw(void)
{
  PRIVATE(this)->sorendermanager->render(PRIVATE(this)->clearwindow,
                                         PRIVATE(this)->clearzbuffer);
}

bool 
QuarterWidget::processSoEvent(const SoEvent * event)
{
  return 
    event && 
    PRIVATE(this)->soeventmanager &&
    PRIVATE(this)->soeventmanager->processEvent(event);
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
  PRIVATE(this)->sorendermanager->scheduleRedraw();
}

/*!  
  Returns color used for clearing the rendering area before
  rendering the scene.
 */
QColor
QuarterWidget::backgroundColor(void) const
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
QuarterWidget::setContextMenuEnabled(bool yes)
{
  PRIVATE(this)->contextmenuenabled = yes;
}

/*!
  Convenience method that adds a state machine to the current
  SoEventManager.  It also initializes the scene graph
  root and active camera for the state machine, and finally it sets
  up the default Quarter cursor handling.

  \sa removeStateMachine
*/
void 
QuarterWidget::addStateMachine(SoScXMLStateMachine * statemachine)
{
  SoEventManager * em = this->getSoEventManager();
  em->addSoScXMLStateMachine(statemachine);
  statemachine->setSceneGraphRoot(this->getSoRenderManager()->getSceneGraph());
  statemachine->setActiveCamera(this->getSoRenderManager()->getCamera());
  statemachine->addStateChangeCallback(QuarterWidgetP::statechangecb, PRIVATE(this));
}

/*!
  Convenience method that removes a state machine to the current
  SoEventManager.

  /sa addStateMachine
*/
void 
QuarterWidget::removeStateMachine(SoScXMLStateMachine * statemachine)
{
  SoEventManager * em = this->getSoEventManager();
  statemachine->setSceneGraphRoot(NULL);
  statemachine->setActiveCamera(NULL);
  em->removeSoScXMLStateMachine(statemachine);
}

QSize 
QuarterWidget::minimumSizeHint(void) const
{
  return QSize(50, 50);
}

#undef PRIVATE
