/**************************************************************************\
 *
 *  This file is part of the SIM Quarter extension library for Coin.
 *  Copyright (C) 1998-2009 by Systems in Motion.  All rights reserved.
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

#include <Quarter/devices/InputDevice.h>
#include <QtGui/QInputEvent>
#include <Inventor/events/SoEvents.h>

using namespace SIM::Coin3D::Quarter;

/*!
  \class SIM::Coin3D::Quarter::InputDevice InputDevice.h Quarter/devices/InputDevice.h

  \brief The InputDevice class is the base class for devices such as
  the Keyboard and Mouse. It can be subclassed to support other
  devices.
*/

InputDevice::InputDevice(void)
{
  this->mousepos = SbVec2s(0, 0);
}

/*!
  Sets the mouseposition

  \param[in] pos position of mouse in pixelcoordinates
*/
void
InputDevice::setMousePosition(const SbVec2s & pos)
{
  this->mousepos = pos;
}

/*!
  Sets the window size of the owning window

  \param[in] size in pixels
*/
void
InputDevice::setWindowSize(const SbVec2s & size)
{
  this->windowsize = size;
}

/*!
  Transforms a qevent into an soevent

  \param[in,out] soevent the transformed event
  \param[in] qevent incoming qevent
*/
void
InputDevice::setModifiers(SoEvent * soevent, const QInputEvent * qevent)
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

/*!
  \var InputDevice::mousepos

  Holds the last known position of the mouse. This should be set even
  for a keyboard event.
*/

/*!
  \var InputDevice::windowsize

  Holds the size of the owning window
*/

#undef PRIVATE
