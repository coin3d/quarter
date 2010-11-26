#ifndef QUARTER_NATIVEEVENT_H
#define QUARTER_NATIVEEVENT_H

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

#include <QtCore/QObject>
#include <QtCore/QEvent>

#ifdef HAVE_SPACENAV_LIB
#include <X11/Xlib.h>
#endif

namespace SIM { namespace Coin3D { namespace Quarter {

class NativeEvent : public QEvent {
public:
#ifdef HAVE_SPACENAV_LIB
  NativeEvent(XEvent * nativeevent);
  XEvent * getEvent() const;
#else // !HAVE_SPACENAV_LIB
  NativeEvent();
#endif // !HAVE_SPACENAV_LIB

  virtual ~NativeEvent();

private:
  void * rawevent;
};

}}}

#endif // !QUARTER_NATIVEEVENT_H
