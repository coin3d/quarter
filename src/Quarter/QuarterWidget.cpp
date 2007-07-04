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
#include <Inventor/actions/SoSearchAction.h>
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
QuarterWidget::QuarterWidget(QWidget * parent)
  : inherited(parent) 
{
  this->constructor();
}

/*! constructor */
QuarterWidget::QuarterWidget(QGLContext * context, QWidget * parent)
  : inherited(context, parent)
{
  this->constructor();
}

void
QuarterWidget::constructor(void)
{
  PRIVATE(this) = new QuarterWidgetP(this);

  PRIVATE(this)->sorendermanager = new SoRenderManager;
  PRIVATE(this)->soeventmanager = new SoEventManager;
  PRIVATE(this)->devicemanager = new DeviceManager(this);
  PRIVATE(this)->eventmanager = new EventManager(this);
  PRIVATE(this)->navigationsystem = SoNavigationSystem::createByName(SO_EXAMINER_SYSTEM);
  PRIVATE(this)->headlight = new SoDirectionalLight;
  PRIVATE(this)->headlight->ref();
  
  PRIVATE(this)->sorendermanager->setAutoClipping(SoRenderManager::VARIABLE_NEAR_PLANE);
  PRIVATE(this)->sorendermanager->setRenderCallback(QuarterWidget::renderCB, this);
  PRIVATE(this)->sorendermanager->setBackgroundColor(SbColor(0.0f, 0.0f, 0.0f));
  PRIVATE(this)->sorendermanager->activate();
  
  PRIVATE(this)->soeventmanager->setNavigationSystem(PRIVATE(this)->navigationsystem);
  PRIVATE(this)->soeventmanager->setNavigationState(SoEventManager::MIXED_NAVIGATION);
  
  PRIVATE(this)->devicemanager->registerDevice(new MouseHandler);
  PRIVATE(this)->devicemanager->registerDevice(new KeyboardHandler);
  
  PRIVATE(this)->eventmanager->registerEventHandler(new ContextMenuHandler);
  PRIVATE(this)->eventmanager->registerEventHandler(new DragDropHandler);

  this->setMouseTracking(TRUE);
}

/*! destructor */
QuarterWidget::~QuarterWidget()
{
  PRIVATE(this)->headlight->unref();
  delete PRIVATE(this)->sorendermanager;
  delete PRIVATE(this)->soeventmanager;
  delete PRIVATE(this)->eventmanager;
  delete PRIVATE(this)->devicemanager;
  delete PRIVATE(this)->navigationsystem;

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
  Sets the Inventor scenegraph to be rendered
 */
void
QuarterWidget::setSceneGraph(SoNode * node)
{
  SoCamera * camera = NULL;
  SoSeparator * superscene = NULL;

  if (node) {
    node->ref();
    SoSearchAction sa;
    sa.setType(SoCamera::getClassTypeId());
    sa.setInterest(SoSearchAction::FIRST);
    sa.apply(node);
    
    SbBool createcamera = sa.getPath() == NULL; 
    superscene = PRIVATE(this)->createSuperScene(createcamera, TRUE);
    superscene->addChild(node);
    node->unref();
  }
  
  if (superscene) {
    superscene->ref();
    camera = PRIVATE(this)->getCamera(superscene);
    superscene->unrefNoDelete();
  }
  
  PRIVATE(this)->soeventmanager->setSceneGraph(superscene);
  PRIVATE(this)->sorendermanager->setSceneGraph(superscene);
  PRIVATE(this)->soeventmanager->setCamera(camera);
  PRIVATE(this)->sorendermanager->setCamera(camera);
  
  PRIVATE(this)->navigationsystem->viewAll();
  superscene->touch();
}

/*! Set the camera to be manipulated trough the viewer controls. The
  camera passed in as argument must already be part of the scene
  graph. If the application code does not explicitly call this method,
  the scenegraph will be searched for a camera to use. If there are
  more than one camera in the scenegraph, the first one is used.
 */
void 
QuarterWidget::setCamera(SoCamera * camera)
{
  PRIVATE(this)->navigationsystem->setCamera(camera);
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
  PRIVATE(this)->navigationsystem->viewAll();
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
