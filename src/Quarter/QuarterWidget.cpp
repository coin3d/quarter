/**************************************************************************\
 *
 *  This file is part of the SIM Quarter extension library for Coin.
 *  Copyright (C) 1998-2007 by Systems in Motion.  All rights reserved.
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
#include <Inventor/navigation/SoNavigationSystem.h>

#include <Quarter/QuarterWidget.h>
#include <Quarter/devices/DeviceManager.h>
#include <Quarter/devices/MouseHandler.h>
#include <Quarter/devices/KeyboardHandler.h>
#include <Quarter/eventhandlers/EventManager.h>
#include <Quarter/eventhandlers/ContextMenuHandler.h>
#include <Quarter/eventhandlers/DragDropHandler.h>

#include "QuarterWidgetP.h"

using namespace SIM::Coin3D::Quarter;

#define PRIVATE(obj) obj->pimpl

/*! constructor */
QuarterWidget::QuarterWidget(QWidget * parent, const QGLWidget * sharewidget)
  : inherited(parent, sharewidget, 0) 
{
  this->constructor(sharewidget);
}

/*! constructor */
QuarterWidget::QuarterWidget(QGLContext * context, QWidget * parent, const QGLWidget * sharewidget)
  : inherited(context, parent, sharewidget, 0)
{
  this->constructor(sharewidget);
}

void
QuarterWidget::constructor(const QGLWidget * sharewidget)
{
  PRIVATE(this) = new QuarterWidgetP(this, sharewidget);
  
  PRIVATE(this)->sorendermanager = new SoRenderManager;
  PRIVATE(this)->soeventmanager = new SoEventManager;
  PRIVATE(this)->devicemanager = new DeviceManager(this);
  PRIVATE(this)->eventmanager = new EventManager(this);
  PRIVATE(this)->headlight = new SoDirectionalLight;
  PRIVATE(this)->headlight->ref();
  
  PRIVATE(this)->sorendermanager->setAutoClipping(SoRenderManager::VARIABLE_NEAR_PLANE);
  PRIVATE(this)->sorendermanager->setRenderCallback(QuarterWidget::renderCB, this);
  PRIVATE(this)->sorendermanager->setBackgroundColor(SbColor(0.0f, 0.0f, 0.0f));
  PRIVATE(this)->sorendermanager->activate();
  
  PRIVATE(this)->soeventmanager->setNavigationState(SoEventManager::MIXED_NAVIGATION);
  
  PRIVATE(this)->devicemanager->registerDevice(new MouseHandler);
  PRIVATE(this)->devicemanager->registerDevice(new KeyboardHandler);
  
  PRIVATE(this)->eventmanager->registerEventHandler(new ContextMenuHandler);
  PRIVATE(this)->eventmanager->registerEventHandler(new DragDropHandler);

  // set up a cache context for the default SoGLRenderAction
  PRIVATE(this)->sorendermanager->getGLRenderAction()->setCacheContext(this->getCacheContextId());
  
  this->setMouseTracking(TRUE);

  // set focus policy to Strong by default
  this->setFocusPolicy(Qt::StrongFocus);
}

/*! destructor */
QuarterWidget::~QuarterWidget()
{
  PRIVATE(this)->headlight->unref();
  delete PRIVATE(this)->sorendermanager;
  delete PRIVATE(this)->soeventmanager;
  delete PRIVATE(this)->eventmanager;
  delete PRIVATE(this)->devicemanager;
  delete PRIVATE(this);
}

/*!
  Enable/diable the headlight. This wille toggle the SoDirectionalLigh::on
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
  SoCamera * camera = NULL;
  SoSeparator * superscene = NULL;
  SbBool viewall = FALSE;
  
  if (node) {
    node->ref();

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
  return PRIVATE(this)->sorendermanager->getSceneGraph();
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
  Returns a pointer to the render manager
 */
SoRenderManager * 
QuarterWidget::getSoRenderManager(void) const
{
  return PRIVATE(this)->sorendermanager;
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
  PRIVATE(this)->soeventmanager->getNavigationSystem()->viewAll();
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
  PRIVATE(this)->sorendermanager->render(TRUE, TRUE);
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

#undef PRIVATE
