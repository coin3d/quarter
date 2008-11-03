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
  \class SIM::Coin3D::Quarter::KeyboardHandler KeyboardHandler.h Quarter/devices/KeyboardHandler.h

  \brief The KeyboardHandler class provides translation of keyboard
  events on the QuarterWidget. It is registered with the DeviceManager
  by default.
*/


#include <Quarter/devices/Keyboard.h>

#include <QtCore/QEvent>
#include <QtGui/QKeyEvent>
#include <Inventor/events/SoEvents.h>
#include <Inventor/events/SoKeyboardEvent.h>

#include "KeyboardP.h"

using namespace SIM::Coin3D::Quarter;

#define PRIVATE(obj) obj->pimpl

Keyboard::Keyboard(void)
{
  PRIVATE(this) = new KeyboardP(this);
}

Keyboard::~Keyboard()
{
  delete PRIVATE(this);
}

/*! Translates from QKeyEvents to SoKeyboardEvents
 */
const SoEvent *
Keyboard::translateEvent(QEvent * event)
{
  switch (event->type()) {
  case QEvent::KeyPress:
  case QEvent::KeyRelease:
    return PRIVATE(this)->keyEvent((QKeyEvent *) event);
  default:
    return NULL;
  }
}

#undef PRIVATE
