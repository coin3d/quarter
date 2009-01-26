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

/*!
  \class SIM::Coin3D::Quarter::FocusHandler FocusHandler.h Quarter/devices/FocusHandler.h

  \brief The FocusHandler eventfilter provides Coin with focus in and
  focus out events, if installed on QuarterWidget.
*/

#include <Quarter/eventhandlers/FocusHandler.h>
#include <Quarter/QuarterWidget.h>
#include <QtCore/QEvent>
#include <Inventor/SoEventManager.h>
#include <Inventor/scxml/SoScXMLStateMachine.h>

using namespace SIM::Coin3D::Quarter;

FocusHandler::FocusHandler(QObject * parent)
  : QObject(parent)
{
  this->quarterwidget = dynamic_cast<QuarterWidget *>(parent);
}

FocusHandler::~FocusHandler()
{

}

bool 
FocusHandler::eventFilter(QObject * obj, QEvent * event)
{
  switch (event->type()) {
  case QEvent::FocusIn:
    this->focusEvent("sim.coin3d.coin.InputFocus.IN");
    break;
  case QEvent::FocusOut:
    this->focusEvent("sim.coin3d.coin.InputFocus.OUT");
    break;
  }
  return QObject::eventFilter(obj, event);
}

void
FocusHandler::focusEvent(const SbName & focusevent)
{
  SoEventManager * eventmanager = this->quarterwidget->getSoEventManager();
  for (int c = 0; c < eventmanager->getNumSoScXMLStateMachines(); ++c) {
    SoScXMLStateMachine * sostatemachine =
      eventmanager->getSoScXMLStateMachine(c);
    if (sostatemachine->isActive()) {
      sostatemachine->queueEvent(focusevent);
      sostatemachine->processEventQueue();
    }
  }
}
