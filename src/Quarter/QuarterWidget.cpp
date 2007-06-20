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
#include <Inventor/SbColor.h>

#include <NutsnBolts/NbSceneManager.h>
#include <NutsnBolts/navigation/NbNavigationSystem.h>

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

  PRIVATE(this)->scenemanager = new NbSceneManager;
  PRIVATE(this)->devicemanager = new DeviceManager(this);
  PRIVATE(this)->eventmanager = new EventManager(this);
  PRIVATE(this)->navigationsystem = NbNavigationSystem::createByName(NB_EXAMINER_SYSTEM);

  PRIVATE(this)->scenemanager->setNavigationSystem(PRIVATE(this)->navigationsystem);
  PRIVATE(this)->scenemanager->setNavigationState(NbSceneManager::MIXED_NAVIGATION);
  PRIVATE(this)->scenemanager->setRenderCallback(QuarterWidget::renderCB, this);
  PRIVATE(this)->scenemanager->setBackgroundColor(SbColor(0.0f, 0.0f, 0.0f));
  PRIVATE(this)->scenemanager->activate();
  
  PRIVATE(this)->devicemanager->registerDevice(new MouseHandler);
  PRIVATE(this)->devicemanager->registerDevice(new KeyboardHandler);
  
  PRIVATE(this)->eventmanager->registerEventHandler(new ContextMenuHandler);
  PRIVATE(this)->eventmanager->registerEventHandler(new DragDropHandler);

  this->setMouseTracking(TRUE);
}

/*! destructor */
QuarterWidget::~QuarterWidget()
{
  delete PRIVATE(this)->scenemanager;
  delete PRIVATE(this)->eventmanager;
  delete PRIVATE(this)->devicemanager;
  delete PRIVATE(this)->navigationsystem;

  delete PRIVATE(this);
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
    superscene = PRIVATE(this)->createSuperScene();
    camera = PRIVATE(this)->getCamera(superscene);

    superscene->addChild(node);
  }

  PRIVATE(this)->navigationsystem->setCamera(camera);  
  PRIVATE(this)->scenemanager->setSceneGraph(superscene);
  
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
  Returns a pointer to the scene manager
 */
SoSceneManager * 
QuarterWidget::getSceneManager(void) const
{
  return PRIVATE(this)->scenemanager;
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
  PRIVATE(this)->scenemanager->setViewportRegion(SbViewportRegion(width, height));
}

/*!
  Overridden from QGLWidget to render the scenegraph
 */
void
QuarterWidget::paintGL(void)
{
  PRIVATE(this)->scenemanager->render(TRUE, TRUE);
}

/*!
  Overridden from QGLWidget to render the scenegraph
 */
void 
QuarterWidget::actualRedraw(void)
{
  PRIVATE(this)->scenemanager->render(TRUE, TRUE);
}

/*!

 */
void 
QuarterWidget::renderCB(void * closure, SoSceneManager *)
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
  if (soevent && PRIVATE(this)->scenemanager->processEvent(soevent)) {
    return true;
  }
  return inherited::event(event);
}

#undef PRIVATE
