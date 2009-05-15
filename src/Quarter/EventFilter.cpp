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

/*!  \class SIM::Coin3D::Quarter::EventFilter EventFilter.h Quarter/eventhandlers/EventFilter.h

*/

#include <Quarter/eventhandlers/EventFilter.h>

#include <QtCore/QEvent>
#include <QtGui/QMouseEvent>

#include <Inventor/SoEventManager.h>
#include <Inventor/events/SoLocation2Event.h>
#include <Inventor/events/SoMouseButtonEvent.h>

#include <Quarter/QuarterWidget.h>
#include <Quarter/devices/Mouse.h>
#include <Quarter/devices/Keyboard.h>

namespace SIM { namespace Coin3D { namespace Quarter {

class EventFilterP {
public:
  QList<InputDevice *> devices;
  QuarterWidget * quarterwidget;
  QPoint globalmousepos;
  SbVec2s windowsize;

  void trackWindowSize(QResizeEvent * event)
  {
    this->windowsize = SbVec2s(event->size().width(),
                               event->size().height());

    foreach(InputDevice * device, this->devices) {
      device->setWindowSize(this->windowsize);
    }
  }

  void trackPointerPosition(QMouseEvent * event)
  {
    assert(this->windowsize[1] != -1);
    this->globalmousepos = event->globalPos();

    SbVec2s mousepos(event->pos().x(), this->windowsize[1] - event->pos().y() - 1);
    foreach(InputDevice * device, this->devices) {
      device->setMousePosition(mousepos);
    }
  }

};

#define PRIVATE(obj) obj->pimpl

}}} // namespace

using namespace SIM::Coin3D::Quarter;

EventFilter::EventFilter(QObject * parent)
  : QObject(parent)
{
  PRIVATE(this) = new EventFilterP;

  PRIVATE(this)->quarterwidget = dynamic_cast<QuarterWidget *>(parent);
  assert(PRIVATE(this)->quarterwidget);

  PRIVATE(this)->windowsize = SbVec2s(PRIVATE(this)->quarterwidget->width(),
                                      PRIVATE(this)->quarterwidget->height());

  PRIVATE(this)->devices += new Mouse;
  PRIVATE(this)->devices += new Keyboard;
}

EventFilter::~EventFilter()
{
  qDeleteAll(PRIVATE(this)->devices);
  delete PRIVATE(this);
}

/*!
  Adds a device for event translation
 */
void 
EventFilter::registerInputDevice(InputDevice * device)
{
  PRIVATE(this)->devices += device;
}

/*!
  Removes a device from event translation
 */
void 
EventFilter::unregisterInputDevice(InputDevice * device)
{
  int i = PRIVATE(this)->devices.indexOf(device);
  if (i != -1) {
    PRIVATE(this)->devices.removeAt(i);
  }
}

/*! Translates Qt Events into Coin events and passes them on to the
  event QuarterWidget for processing. If the event can not be
  translated or processed, it is forwarded to Qt and the method
  returns false.
 */
bool
EventFilter::eventFilter(QObject * obj, QEvent * qevent)
{
  // make sure every device has updated screen size and mouse position
  // before translating events
  switch (qevent->type()) {
  case QEvent::MouseMove:
  case QEvent::MouseButtonPress:
  case QEvent::MouseButtonRelease:
  case QEvent::MouseButtonDblClick:
    PRIVATE(this)->trackPointerPosition(dynamic_cast<QMouseEvent *>(qevent));
    break;
  case QEvent::Resize:
    PRIVATE(this)->trackWindowSize(dynamic_cast<QResizeEvent *>(qevent));
    break;
  default:
    break;
  }

  // translate QEvent into SoEvent and see if it is handled by scene
  // graph
  foreach(InputDevice * device, PRIVATE(this)->devices) {
    const SoEvent * soevent = device->translateEvent(qevent);
    if (soevent && PRIVATE(this)->quarterwidget->processSoEvent(soevent)) {
      return true;
    }
  }
  return false;
}

/*!
  Returns mouse position in global coordinates
 */
const QPoint &
EventFilter::globalMousePosition(void) const
{
  return PRIVATE(this)->globalmousepos;
}

#undef PRIVATE
