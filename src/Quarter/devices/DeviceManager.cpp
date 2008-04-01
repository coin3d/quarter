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
#include <QtCore/QEvent>
#include <QtGui/QMouseEvent>
#include <Inventor/events/SoLocation2Event.h>
#include <Quarter/devices/DeviceManager.h>
#include <Quarter/devices/DeviceHandler.h>
#include <Quarter/QuarterWidget.h>

namespace SIM { namespace Coin3D { namespace Quarter {

class DeviceManagerP {
public:
  QList<DeviceHandler *> devices;
  QuarterWidget * quarterwidget;
  SbVec2s lastmousepos;
  QPoint globalpos;
};

}}} // namespace

#define PRIVATE(obj) obj->pimpl

using namespace SIM::Coin3D::Quarter;

/*!
  constructor
 */
DeviceManager::DeviceManager(QuarterWidget * quarterwidget)
{
  assert(quarterwidget);
  PRIVATE(this) = new DeviceManagerP;
  PRIVATE(this)->quarterwidget = quarterwidget;
  PRIVATE(this)->lastmousepos = SbVec2s(0, 0);
}

/*!
  destructor
 */
DeviceManager::~DeviceManager()
{
  qDeleteAll(PRIVATE(this)->devices);
  delete PRIVATE(this);
}

/*!
  Runs trough the list of registered devices to translate events
 */
const SoEvent *
DeviceManager::translateEvent(QEvent * qevent)
{
  if (qevent->type() == QEvent::MouseMove) {
    QMouseEvent * mouseevent = static_cast<QMouseEvent *>(qevent);
    PRIVATE(this)->globalpos = mouseevent->globalPos();
  }

  DeviceHandler * device;
  foreach(device, PRIVATE(this)->devices) {
    if (const SoEvent * soevent = device->translateEvent(qevent)) {
      // cache mouse position so other devices can access it
      if (soevent->getTypeId() == SoLocation2Event::getClassTypeId()) {
        PRIVATE(this)->lastmousepos = soevent->getPosition();
      }
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
  return PRIVATE(this)->quarterwidget;
}

/*!
  Returns the last mouse position in global coordinates
*/
const QPoint & 
DeviceManager::getLastGlobalPosition(void) const
{
  return PRIVATE(this)->globalpos;
}

/*!
  Returns the last mouse position
*/
const SbVec2s & 
DeviceManager::getLastMousePosition(void) const
{
  return PRIVATE(this)->lastmousepos;
}

/*!
  Register a device for event translation
 */
void
DeviceManager::registerDevice(DeviceHandler * device)
{
  if (!PRIVATE(this)->devices.contains(device)) {
    device->setManager(this);
    PRIVATE(this)->devices += device;
  }
}

/*!
  unregister a device
 */
void
DeviceManager::unregisterDevice(DeviceHandler * device)
{
  if (PRIVATE(this)->devices.contains(device)) {
    PRIVATE(this)->devices.removeAt(PRIVATE(this)->devices.indexOf(device));
  }
}

#undef PRIVATE
