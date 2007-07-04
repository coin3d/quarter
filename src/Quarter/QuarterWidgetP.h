#ifndef QUARTER_QUARTERWIDGETP_H
#define QUARTER_QUARTERWIDGETP_H

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

#include <Inventor/SbBasic.h>

class SoNode;
class SoCamera;
class SoSeparator;
class SoSceneManager;
class SoRenderManager;
class SoEventManager;
class SoNavigationSystem;
class SoSwitch;
class SoDirectionalLight;

namespace SIM { namespace Coin3D { namespace Quarter {

class DeviceManager;
class EventManager;

class QuarterWidgetP {
public:
  QuarterWidgetP(class QuarterWidget * master);
  ~QuarterWidgetP();
  
  SoSeparator * createSuperScene(const SbBool createcamera,
                                 const SbBool addheadlight);
  
  SoCamera * getCamera(SoSeparator * root);
  
  SoNavigationSystem * navigationsystem;  
  SoSceneManager * scenemanager;
  DeviceManager * devicemanager;
  EventManager * eventmanager;
  SoRenderManager * sorendermanager;
  SoEventManager * soeventmanager;
  SoDirectionalLight * headlight;
};

#endif // QUARTER_QUARTERWIDGETP_H

}}} // namespace
