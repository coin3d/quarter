/**************************************************************************\
 *
 *  This file is part of the SIM Quarter extension library for Coin.
 *  Copyright (C) 1998-2010 by Systems in Motion.  All rights reserved.
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
 *  Kongsberg Oil & Gas Technologies, Bygdoy Alle 5, 0257 Oslo, NORWAY.
 *  http://www.sim.no/  sales@sim.no  coin-support@coin3d.org
 *
\**************************************************************************/


#include "NativeEvent.h"

using namespace SIM::Coin3D::Quarter;

#ifdef HAVE_SPACENAV_LIB
NativeEvent::NativeEvent(XEvent * nativeevent)
  : QEvent(QEvent::User)
{
  this->rawevent = nativeevent;
}


XEvent * 
NativeEvent::getEvent() const
{
  return static_cast<XEvent *>(this->rawevent);
}

#else // !HAVE_SPACENAV_LIB

// Dummy constructor when Spacenav is not available.
NativeEvent::NativeEvent()
  : QEvent(QEvent::User)
{
  this->rawevent = NULL;
}

#endif // !HAVE_SPACENAV_LIB


NativeEvent::~NativeEvent()
{
#ifdef HAVE_SPACENAV_LIB
  delete (XEvent *) this->rawevent;
#endif // HAVE_SPACENAV_LIB
}

