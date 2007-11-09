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

/*! \class SIM::Coin3D::Quarter::DeviceManager DeviceManager.h Quarter/devices/DeviceManager.h

  \brief The DeviceManager class is responsible for holding a list of
  devices which can translate events such as a MouseHandler and
  KeyboardHandler for translation of mouse and keyboard events,
  respectively.

  Custom device handlers can be registered with this class for more
  functionality
*/


#include <assert.h>
#include <Quarter/devices/DeviceManager.h>
#include <Quarter/devices/DeviceHandler.h>
#include <Quarter/QuarterWidget.h>

using namespace SIM::Coin3D::Quarter;

/*!
  constructor
 */
DeviceManager::DeviceManager(QuarterWidget * quarterwidget)
{
  assert(quarterwidget);
  this->quarterwidget = quarterwidget;
}

/*!
  destructor
 */
DeviceManager::~DeviceManager()
{
  qDeleteAll(this->devices);
}

/*!
  Runs trough the list of registered devices to translate events
 */
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

/*!
  Returns the QuarterWidget this devicemanager belongs to
 */
const QuarterWidget *
DeviceManager::getWidget(void) const
{
  return this->quarterwidget;
}

/*!
  Register a device for event translation
 */
void
DeviceManager::registerDevice(DeviceHandler * device)
{
  if (!this->devices.contains(device)) {
    device->setManager(this);
    this->devices += device;
  }
}

/*!
  unregister a device
 */
void
DeviceManager::unregisterDevice(DeviceHandler * device)
{
  if (this->devices.contains(device)) {
    this->devices.removeAt(this->devices.indexOf(device));
  }
}
