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

#include "SensorManager.h"

#include <QtCore/QTimer>

#include <Inventor/SoDB.h>
#include <Inventor/SbTime.h>
#include <Inventor/SoRenderManager.h>
#include <Inventor/nodekits/SoNodeKit.h>
#include <Inventor/C/threads/thread.h>
#include "SignalThread.h"

using namespace SIM::Coin3D::Quarter;

SensorManager::SensorManager(void)
  : inherited()
{
  this->mainthreadid = cc_thread_id();
  this->signalthread = new SignalThread();

  QObject::connect(this->signalthread, SIGNAL(triggerSignal()),
                   this, SLOT(sensorQueueChanged()));

  this->idletimer = new QTimer;
  this->delaytimer = new QTimer;
  this->timerqueuetimer = new QTimer;

  this->idletimer->setSingleShot(true);
  this->delaytimer->setSingleShot(true);
  this->timerqueuetimer->setSingleShot(true);

  this->connect(this->idletimer, SIGNAL(timeout(void)), this, SLOT(idleTimeout()));
  this->connect(this->delaytimer, SIGNAL(timeout(void)), this, SLOT(delayTimeout()));
  this->connect(this->timerqueuetimer, SIGNAL(timeout(void)), this, SLOT(timerQueueTimeout()));

  SoDB::getSensorManager()->setChangedCallback(SensorManager::sensorQueueChangedCB, this);
  this->timerEpsilon = 1.0 / 5000.0;

  SoDB::setRealTimeInterval(1.0 / 25.0);
  SoRenderManager::enableRealTimeUpdate(FALSE);
}

SensorManager::~SensorManager()
{
  // remove the Coin callback before shutting down
  SoDB::getSensorManager()->setChangedCallback(NULL, NULL);

  if (this->signalthread->isRunning()) {
    this->signalthread->stopThread();
    this->signalthread->wait();
  }
  delete this->signalthread;
  delete this->idletimer;
  delete this->delaytimer;
  delete this->timerqueuetimer;
}

void
SensorManager::sensorQueueChangedCB(void * closure)
{
  SensorManager * thisp = (SensorManager * ) closure;

  // if we get a callback from another thread, route the callback
  // through SignalThread so that we receive the callback in the
  // QApplication thread (needed since QTimer isn't thread safe)
  if (cc_thread_id() != thisp->mainthreadid) {
    if (!thisp->signalthread->isRunning()) thisp->signalthread->start();
    thisp->signalthread->trigger();
  }
  else {
    thisp->sensorQueueChanged();
  }
}

void
SensorManager::sensorQueueChanged(void)
{
  SoSensorManager * sensormanager = SoDB::getSensorManager();
  assert(sensormanager);

  SbTime interval;
  if (sensormanager->isTimerSensorPending(interval)) {
    interval -= SbTime::getTimeOfDay();
    if (interval.getValue() < this->timerEpsilon) {
      interval.setValue(this->timerEpsilon);
    }
    if (!this->timerqueuetimer->isActive()) {
      this->timerqueuetimer->start(interval.getMsecValue());
    } else {
      this->timerqueuetimer->setInterval(interval.getMsecValue());
    }
  } else if (this->timerqueuetimer->isActive()) {
    this->timerqueuetimer->stop();
  }

  if (sensormanager->isDelaySensorPending()) {
    this->idletimer->start(0);

    if (!this->delaytimer->isActive()) {
      SbTime time = SoDB::getDelaySensorTimeout();
      if (time != SbTime::zero()) {
        this->delaytimer->start(time.getMsecValue());
      }
    }
  } else {
    if (this->idletimer->isActive()) {
      this->idletimer->stop();
    }
    if (this->delaytimer->isActive()) {
      this->delaytimer->stop();
    }
  }
}

void
SensorManager::idleTimeout(void)
{
  SoDB::getSensorManager()->processTimerQueue();
  SoDB::getSensorManager()->processDelayQueue(TRUE);
  this->sensorQueueChanged();
}

void
SensorManager::timerQueueTimeout(void)
{
  SoDB::getSensorManager()->processTimerQueue();
  this->sensorQueueChanged();
}

void
SensorManager::delayTimeout(void)
{
  SoDB::getSensorManager()->processTimerQueue();
  SoDB::getSensorManager()->processDelayQueue(FALSE);
  this->sensorQueueChanged();
}

void
SensorManager::setTimerEpsilon(double sec)
{
  this->timerEpsilon = sec;
}
