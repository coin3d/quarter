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

/*!  \class SIM::Coin3D::Quarter::DeviceHandler DeviceHandler.h Quarter/devices/DeviceHandler.h

  \brief The DeviceHandler class is the base class for eventhandlers
  such as the KeyboardHandler and MouseHandler. It can be subclassed
  to create event handlers for other devices.
*/


#include <Quarter/devices/DeviceHandler.h>
#include <QtGui/QInputEvent>
#include <Inventor/events/SoEvents.h>

using namespace SIM::Coin3D::Quarter;

void
DeviceHandler::setManager(DeviceManager * manager)
{
  this->manager = manager;
}

void 
DeviceHandler::setModifiers(SoEvent * soevent, QInputEvent * qevent)
{
  // FIXME: How do we get the time from the qevent? (20070306 frodo)
  soevent->setTime(SbTime::getTimeOfDay());

  // Note: On Mac OS X, the ControlModifier value corresponds to the
  // Command keys on the Macintosh keyboard, and the MetaModifier
  // value corresponds to the Control keys.
  soevent->setShiftDown(qevent->modifiers() & Qt::ShiftModifier);
  soevent->setAltDown(qevent->modifiers() & Qt::AltModifier);
  soevent->setCtrlDown(qevent->modifiers() & Qt::ControlModifier);
}

#undef PRIVATE
