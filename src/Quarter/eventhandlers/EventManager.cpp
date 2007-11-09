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

/*! \class SIM::Coin3D::Quarter::EventManager EventManager.h Quarter/devices/EventManager.h

  \brief The EventManager class is responsible for holding a list of
  devices which can translate events such as a MouseHandler and
  KeyboardHandler for translation of mouse and keyboard events,
  respectively.

  Custom device handlers can be registered with this class for more
  functionality
*/


#include <assert.h>
#include <Quarter/eventhandlers/EventManager.h>
#include <Quarter/eventhandlers/EventHandler.h>
#include <Quarter/QuarterWidget.h>

using namespace SIM::Coin3D::Quarter;

/*!
  constructor
 */
EventManager::EventManager(QuarterWidget * quarterwidget)
{
  assert(quarterwidget);
  this->quarterwidget = quarterwidget;
}

/*!
  destructor
 */
EventManager::~EventManager()
{
  qDeleteAll(this->eventhandlers);
}

/*!
  Runs trough the list of registered devices to translate events
 */
bool
EventManager::handleEvent(QEvent * qevent)
{
  EventHandler * handler;
  foreach(handler, this->eventhandlers) {
    if (handler->handleEvent(qevent)) {
      return true;
    }
  }
  return false;
}

/*!
  Returns the QuarterWidget this devicemanager belongs to
 */
QuarterWidget *
EventManager::getWidget(void) const
{
  return this->quarterwidget;
}

/*!
  Register a device for event translation
 */
void
EventManager::registerEventHandler(EventHandler * handler)
{
  if (!this->eventhandlers.contains(handler)) {
    handler->setManager(this);
    this->eventhandlers += handler;
  }
}

/*!
  unregister a device
 */
void
EventManager::unregisterEventHandler(EventHandler * handler)
{
  if (this->eventhandlers.contains(handler)) {
    this->eventhandlers.removeAt(this->eventhandlers.indexOf(handler));
  }
}
