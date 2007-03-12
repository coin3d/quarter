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

#include <assert.h>

#include <Inventor/SbViewportRegion.h>
#include <Inventor/system/gl.h>
#include <Inventor/events/SoEvents.h>
#include <Inventor/nodes/SoNode.h>
#include <Inventor/nodes/SoCamera.h>
#include <Inventor/nodes/SoSeparator.h>

#include <NutsnBolts/NbSceneManager.h>
#include <NutsnBolts/navigation/NbNavigationSystem.h>

#include <Quarter/QuarterWidget.h>
#include <Quarter/devices/DeviceManager.h>
#include <Quarter/devices/MouseHandler.h>
#include <Quarter/devices/KeyboardHandler.h>

#include "QuarterWidgetP.h"

#define PRIVATE(obj) obj->pimpl


QuarterWidget::QuarterWidget(QWidget * parent)
  : inherited(parent) 
{
  this->constructor();
}

QuarterWidget::QuarterWidget(QGLContext * context, QWidget * parent)
  : inherited(context, parent)
{
  this->constructor();
}

void
QuarterWidget::constructor(void)
{
  PRIVATE(this) = new QuarterWidgetP(this);

  PRIVATE(this)->navigationsystem = NbNavigationSystem::createByName(NB_EXAMINER_SYSTEM);
  PRIVATE(this)->scenemanager->setNavigationSystem(PRIVATE(this)->navigationsystem);
  PRIVATE(this)->scenemanager->setNavigationState(NbSceneManager::MIXED_NAVIGATION);
  PRIVATE(this)->scenemanager->setRenderCallback(QuarterWidget::renderCB, this);
  PRIVATE(this)->scenemanager->activate();
  
  PRIVATE(this)->devicemanager->registerDevice(new MouseHandler);
  PRIVATE(this)->devicemanager->registerDevice(new KeyboardHandler);
  
  this->setMouseTracking(TRUE);
}

QuarterWidget::~QuarterWidget()
{
  delete PRIVATE(this);
}

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
  
  PRIVATE(this)->scenemanager->setSceneGraph(superscene);
  PRIVATE(this)->navigationsystem->setCamera(camera);
  
  PRIVATE(this)->navigationsystem->viewAll();
}

void 
QuarterWidget::setCamera(SoCamera * camera)
{
  PRIVATE(this)->navigationsystem->setCamera(camera);
}

DeviceManager * 
QuarterWidget::getDeviceManager(void) const
{
  return PRIVATE(this)->devicemanager;
}

void 
QuarterWidget::viewAll(void)
{
  PRIVATE(this)->navigationsystem->viewAll();
}

void
QuarterWidget::initializeGL(void)
{
  glEnable(GL_DEPTH_TEST);
}

void
QuarterWidget::resizeGL(int width, int height)
{
  PRIVATE(this)->scenemanager->setViewportRegion(SbViewportRegion(width, height));
}

void
QuarterWidget::paintGL(void)
{
  PRIVATE(this)->scenemanager->render(TRUE, TRUE);
}

void 
QuarterWidget::renderCB(void * closure, SoSceneManager * manager)
{
  assert(closure);
  QuarterWidget * thisp = (QuarterWidget *) closure;
  assert(manager == PRIVATE(thisp)->scenemanager);
  
  thisp->makeCurrent();
  PRIVATE(thisp)->scenemanager->render(TRUE, TRUE);
  if (thisp->doubleBuffer()) {
    thisp->swapBuffers();
  }
}

bool 
QuarterWidget::event(QEvent * event)
{
  const SoEvent * soevent = PRIVATE(this)->devicemanager->translateEvent(event);
  if (soevent && PRIVATE(this)->scenemanager->processEvent(soevent)) {
    return true;
  }
  return inherited::event(event);
}

#undef PRIVATE
