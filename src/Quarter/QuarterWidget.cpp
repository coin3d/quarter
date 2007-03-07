/**************************************************************************\
 *
 *  This file is part of the SIM Quarter extension library for Coin.
 *  Copyright (C) 1998-2005 by Systems in Motion.  All rights reserved.
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

#include <Inventor/SoSceneManager.h>
#include <Inventor/SbViewportRegion.h>
#include <Inventor/SbTime.h>
#include <Inventor/system/gl.h>
#include <Inventor/errors/SoDebugError.h>
#include <Inventor/events/SoEvents.h>
#include <Inventor/nodes/SoNode.h>
#include <Inventor/nodes/SoCamera.h>
#include <Inventor/nodes/SoSeparator.h>
#include <Inventor/actions/SoSearchAction.h>

#include <NutsnBolts/NbSceneManager.h>
#include <NutsnBolts/navigation/NbNavigationSystem.h>

#include <Quarter/QuarterWidget.h>
#include <Quarter/QuarterApplication.h>
#include <Quarter/devices/DeviceManager.h>
#include <Quarter/devices/MouseHandler.h>
#include <Quarter/devices/KeyboardHandler.h>

#include <assert.h>

class QuarterWidgetP {
public:
  QuarterWidgetP(QuarterWidget * master) {
    this->scenemanager = new NbSceneManager;
    this->devicemanager = new DeviceManager(master);
    this->root = NULL;
    this->navigationsystem = NULL;
  }

  ~QuarterWidgetP() {
    delete this->scenemanager;
    delete this->devicemanager;
    delete this->navigationsystem;
    if (this->root) {
      this->root->unref();
    }
  }

  NbSceneManager * scenemanager;
  NbNavigationSystem * navigationsystem;
  SoSeparator * root;
  DeviceManager * devicemanager;
};

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

static const char * superscene[] = {
  "#Inventor V2.1 ascii\n",
  "\n",
  "DEF root Separator {\n",
  "  DEF light DirectionalLight {\n",
  "    direction 0 0 -1\n",
  "    intensity 1.0\n",
  "  }\n",
  "  DEF camera PerspectiveCamera {\n",
  "  }\n",
  "}\n",
  NULL
};

SbBool 
QuarterWidget::setSceneGraph(SoNode * node)
{
  if (node == NULL) {
    if (PRIVATE(this)->root) {
      PRIVATE(this)->root->unref();
      PRIVATE(this)->root = NULL;
      PRIVATE(this)->scenemanager->setSceneGraph(NULL);
    }
    return TRUE;
  } else {
    this->setSceneGraph(NULL);
  }

  SoInput in;
  in.setStringArray(superscene);
  SoNode * scene = NULL;
  if (!SoDB::read(&in, scene)) {
    assert(0);
    return FALSE;
  }
  scene->ref(); // actions are applied later
  
  SoSearchAction sa;
  
  // get desired root node
  sa.setInterest(SoSearchAction::FIRST);
  sa.setName(SbName("root"));
  sa.apply(scene);
  if (!sa.getPath()) {
    assert(0 && "no root");
    return FALSE;
  }
  
  SoNode * root = sa.getPath()->getTail();
  if (!root->isOfType(SoSeparator::getClassTypeId())) {
    assert(0 && "invalid root type");
    return FALSE;
  }
  
  PRIVATE(this)->root = (SoSeparator *) root;
  PRIVATE(this)->root->ref();
  root = NULL;
  
  sa.reset();
  sa.setInterest(SoSearchAction::FIRST);
  sa.setType(SoCamera::getClassTypeId());
  sa.apply(PRIVATE(this)->root);
  if (!sa.getPath()) {
    assert(0 && "no camera");
    return FALSE;
  }

  assert(sa.getPath()->getTail()->isOfType(SoCamera::getClassTypeId()));
  SoCamera * camera = (SoCamera *) sa.getPath()->getTail();
  PRIVATE(this)->navigationsystem->setCamera(camera);
  
  PRIVATE(this)->root->addChild(node);
  
  camera->viewAll(PRIVATE(this)->root, 
                  PRIVATE(this)->scenemanager->getViewportRegion());
  
  PRIVATE(this)->scenemanager->setSceneGraph(PRIVATE(this)->root);

  return TRUE;
}

DeviceManager * 
QuarterWidget::getDeviceManager(void) const
{
  return PRIVATE(this)->devicemanager;
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
  if (soevent) {
    return PRIVATE(this)->scenemanager->processEvent(soevent);
  }
  return inherited::event(event);
}

#undef PRIVATE
