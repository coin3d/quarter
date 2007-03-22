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
#include <Quarter/devices/DeviceManager.h>
#include <Quarter/devices/DeviceHandler.h>
#include <Quarter/QuarterWidget.h>

using namespace SIM::Coin3D::Quarter;

DeviceManager::DeviceManager(QuarterWidget * quarterwidget)
{
  assert(quarterwidget);
  this->quarterwidget = quarterwidget;
}

DeviceManager::~DeviceManager()
{
  qDeleteAll(this->devices);
}

const SoEvent * 
DeviceManager::translateEvent(QEvent * qevent)
{
  DeviceHandler * device;
  foreach(device, this->devices) {
    if (const SoEvent * soevent = device->translateEvent(qevent)) {
      return soevent;
    }
  }
  return NULL;
}

const QuarterWidget * 
DeviceManager::getWidget(void) const
{
  return this->quarterwidget;
}

void 
DeviceManager::registerDevice(DeviceHandler * device)
{
  if (!this->devices.contains(device)) {
    device->setManager(this);
    this->devices += device;
  }
}

void 
DeviceManager::unregisterDevice(DeviceHandler * device)
{
  if (this->devices.contains(device)) {
    this->devices.removeAt(this->devices.indexOf(device));
  }
}
