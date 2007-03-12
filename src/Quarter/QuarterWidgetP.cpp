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

#include "QuarterWidgetP.h"

#include <Inventor/nodes/SoCamera.h>
#include <Inventor/nodes/SoSeparator.h>
#include <Inventor/actions/SoSearchAction.h>

#include <NutsnBolts/navigation/NbNavigationSystem.h>
#include <NutsnBolts/NbSceneManager.h>

#include <Quarter/devices/DeviceManager.h>

#include <stdlib.h>

QuarterWidgetP::QuarterWidgetP(QuarterWidget * master) 
{
  this->scenemanager = new NbSceneManager;
  this->devicemanager = new DeviceManager(master);
  this->navigationsystem = NULL;
}

QuarterWidgetP::~QuarterWidgetP() 
{
  delete this->scenemanager;
  delete this->devicemanager;
  delete this->navigationsystem;
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

SoSeparator *
QuarterWidgetP::createSuperScene(void)
{
  SoInput in;
  in.setStringArray(superscene);
  SoNode * scene;
  if (!SoDB::read(&in, scene)) {
    assert(0 && "unable to read superscene");
    return NULL;
  }
  
  scene->ref();
  
  SoSearchAction sa;
  sa.setInterest(SoSearchAction::FIRST);
  sa.setName(SbName("root"));
  sa.apply(scene);
  
  assert(sa.getPath() && 
         sa.getPath()->getTail()->isOfType(SoSeparator::getClassTypeId()) &&
         "wrong or missing root node");

  return (SoSeparator *) sa.getPath()->getTail();
}

SoCamera * 
QuarterWidgetP::getCamera(SoSeparator * root)
{
  SoSearchAction sa;
  sa.setInterest(SoSearchAction::FIRST);
  sa.setType(SoCamera::getClassTypeId());
  sa.apply(root);
  
  assert(sa.getPath() && 
         sa.getPath()->getTail()->isOfType(SoCamera::getClassTypeId()) &&
         "wrong or missing camera");
  
  return (SoCamera *) sa.getPath()->getTail();
}
