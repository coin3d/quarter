#ifndef QUARTER_SENSORMANAGER_H
#define QUARTER_SENSORMANAGER_H

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

#include <QtCore/QObject>

class QTimer;

namespace SIM { namespace Coin3D { namespace Quarter {

class SignalThread;

class SensorManager : public QObject {
  Q_OBJECT
  typedef QObject inherited;
public:
  SensorManager(void);
  ~SensorManager();

public slots:
  void idleTimeout(void);
  void delayTimeout(void);
  void timerQueueTimeout(void);
  void sensorQueueChanged(void);
  void setTimerEpsilon(double sec);

private:
  static void sensorQueueChangedCB(void * closure);
  QTimer * idletimer;
  QTimer * delaytimer;
  QTimer * timerqueuetimer;
  unsigned long mainthreadid;
  SignalThread * signalthread;
  double timerEpsilon;
};

}}} // namespace

#endif // QUARTER_SENSORMANAGER_H
