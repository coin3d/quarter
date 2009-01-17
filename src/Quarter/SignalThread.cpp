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

#include "SignalThread.h"

using namespace SIM::Coin3D::Quarter;

SignalThread::SignalThread(void)
  : isstopped(false)
{
}

SignalThread::~SignalThread()
{
}

void
SignalThread::trigger(void)
{
  // lock first to make sure the QThread is actually waiting for a signal
  this->mutex.lock();
  this->waitcond.wakeOne();
  this->mutex.unlock();
}

void
SignalThread::stopThread(void)
{
  this->mutex.lock();
  this->isstopped = true;
  this->waitcond.wakeOne();
  this->mutex.unlock();
}


void
SignalThread::run(void)
{
  this->mutex.lock();
  while (!this->isstopped) {
    // just wait, and trigger every time we receive a signal
    this->waitcond.wait(&this->mutex);
    if (!this->isstopped) {
      emit triggerSignal();
    }
  }
  this->mutex.unlock();
}
