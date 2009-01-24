#ifndef QUARTER_EVENTFILTER_H
#define QUARTER_EVENTFILTER_H

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

#include <Quarter/Basic.h>
#include <QtCore/QObject>

class QEvent;
class QPoint;

namespace SIM { namespace Coin3D { namespace Quarter {

class InputDevice;

class QUARTER_DLL_API EventFilter : public QObject {
  Q_OBJECT

public:
  EventFilter(QObject * parent);
  ~EventFilter();

  void registerInputDevice(InputDevice * device);
  void unregisterInputDevice(InputDevice * device);

  const QPoint & globalMousePosition(void) const;

protected:
  bool eventFilter(QObject * obj, QEvent * event);

private:
  class EventFilterP * pimpl;
};

}}} // namespace

#endif // QUARTER_EVENTFILTER_H
