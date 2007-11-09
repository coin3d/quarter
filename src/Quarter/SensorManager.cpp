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

#include "SensorManager.h"

#include <QtCore/QTimer>

#include <Inventor/SoDB.h>
#include <Inventor/SbTime.h>
#include <Inventor/SoSceneManager.h>
#include <Inventor/nodekits/SoNodeKit.h>

using namespace SIM::Coin3D::Quarter;

SensorManager::SensorManager(void)
  : inherited()
{
  this->idletimer = new QTimer;
  this->delaytimer = new QTimer;
  this->timerqueuetimer = new QTimer;

  this->idletimer->setSingleShot(true);
  this->delaytimer->setSingleShot(true);
  this->timerqueuetimer->setSingleShot(true);

  this->connect(this->idletimer, SIGNAL(timeout(void)), this, SLOT(idleTimeout()));
  this->connect(this->delaytimer, SIGNAL(timeout(void)), this, SLOT(delayTimeout()));
  this->connect(this->timerqueuetimer, SIGNAL(timeout(void)), this, SLOT(timerQueueTimeout()));

  SoDB::getSensorManager()->setChangedCallback(SensorManager::sensorQueueChanged, this);
  SoDB::setRealTimeInterval(1.0 / 25.0);
  SoSceneManager::enableRealTimeUpdate(FALSE);
}

SensorManager::~SensorManager()
{
  delete this->idletimer;
  delete this->delaytimer;
  delete this->timerqueuetimer;
}

void
SensorManager::sensorQueueChanged(void * closure)
{
  SensorManager * thisp = (SensorManager * ) closure;
  SoSensorManager * sensormanager = SoDB::getSensorManager();
  assert(sensormanager);
  assert(thisp);

  SbTime interval;
  if (sensormanager->isTimerSensorPending(interval)) {
    interval -= SbTime::getTimeOfDay();
    if (interval.getValue() <= 0.0) {
      interval.setValue(1.0/5000.0);
    }
    if (!thisp->timerqueuetimer->isActive()) {
      thisp->timerqueuetimer->start(interval.getMsecValue());
    } else {
      thisp->timerqueuetimer->setInterval(interval.getMsecValue());
    }
  } else if (thisp->timerqueuetimer->isActive()) {
    thisp->timerqueuetimer->stop();
  }

  if (sensormanager->isDelaySensorPending()) {
    thisp->idletimer->start(0);

    if (!thisp->delaytimer->isActive()) {
      SbTime time = SoDB::getDelaySensorTimeout();
      if (time != SbTime::zero()) {
        thisp->delaytimer->start(interval.getMsecValue());
      }
    }
  } else {
    if (thisp->idletimer->isActive()) {
      thisp->idletimer->stop();
    }
    if (thisp->delaytimer->isActive()) {
      thisp->delaytimer->stop();
    }
  }
}

void
SensorManager::idleTimeout(void)
{
  SoDB::getSensorManager()->processTimerQueue();
  SoDB::getSensorManager()->processDelayQueue(TRUE);
  SensorManager::sensorQueueChanged(this);
}

void
SensorManager::timerQueueTimeout(void)
{
  SoDB::getSensorManager()->processTimerQueue();
  SensorManager::sensorQueueChanged(this);
}

void
SensorManager::delayTimeout(void)
{
  SoDB::getSensorManager()->processTimerQueue();
  SoDB::getSensorManager()->processDelayQueue(FALSE);
  SensorManager::sensorQueueChanged(this);
}
