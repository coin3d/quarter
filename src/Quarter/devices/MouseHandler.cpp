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

/*!
  \class SIM::Coin3D::Quarter::MouseHandler MouseHandler.h Quarter/devices/MouseHandler.h

  \brief The MouseHandler class provides translation of mouse events
  on the QuarterWidget. It is registered with the DeviceManager by
  default.
*/

#include <Quarter/devices/MouseHandler.h>

#include <QEvent>
#include <QSize>
#include <QMouseEvent>
#include <QWheelEvent>
#include <QResizeEvent>

#include <Inventor/SbVec2s.h>
#include <Inventor/events/SoEvents.h>
#include <Inventor/errors/SoDebugError.h>

namespace SIM { namespace Coin3D { namespace Quarter {

class MouseHandlerP {
public:
  MouseHandlerP(void) {
    this->location2 = new SoLocation2Event;
    this->mousebutton = new SoMouseButtonEvent;
    this->windowsize = SbVec2s(-1, -1);
  }
  
  ~MouseHandlerP() {
    delete this->location2;
    delete this->mousebutton;
  }
  
  const SoEvent * mouseMoveEvent(QMouseEvent * event);
  const SoEvent * mouseWheelEvent(QWheelEvent * event);
  const SoEvent * mouseButtonEvent(QMouseEvent * event);
  
  void resizeEvent(QResizeEvent * event);
  void setModifiers(SoEvent * soevent, QInputEvent * qevent);
  
  class SoLocation2Event * location2;
  class SoMouseButtonEvent * mousebutton;
  SbVec2s windowsize;
};

}}} // namespace

using namespace SIM::Coin3D::Quarter;

#define PRIVATE(obj) obj->pimpl

MouseHandler::MouseHandler(void)
{
  PRIVATE(this) = new MouseHandlerP;
}

MouseHandler::~MouseHandler()
{
  delete PRIVATE(this);
}

/*! Translates from QMouseEvents to SoLocation2Events and
  SoMouseButtonEVents
 */
const SoEvent * 
MouseHandler::translateEvent(QEvent * event)
{
  switch (event->type()) {
  case QEvent::MouseMove:
    return PRIVATE(this)->mouseMoveEvent((QMouseEvent *) event);
  case QEvent::MouseButtonPress:
  case QEvent::MouseButtonRelease:
    return PRIVATE(this)->mouseButtonEvent((QMouseEvent *) event);
  case QEvent::Wheel:
    return PRIVATE(this)->mouseWheelEvent((QWheelEvent *) event);
  case QEvent::Resize:
    PRIVATE(this)->resizeEvent((QResizeEvent *) event);
    return NULL;
  default:
    return NULL;
  }
}

void 
MouseHandlerP::setModifiers(SoEvent * soevent, QInputEvent * qevent)
{
  // FIXME: How do we get the time from the qevent? (20070306 frodo)
  soevent->setTime(SbTime::getTimeOfDay());
  soevent->setShiftDown(qevent->modifiers() & Qt::ShiftModifier);
  soevent->setCtrlDown(qevent->modifiers() & Qt::ControlModifier);
  soevent->setAltDown(qevent->modifiers() & Qt::AltModifier);
}

void 
MouseHandlerP::resizeEvent(QResizeEvent * event)
{
  this->windowsize = SbVec2s(event->size().width(),
                             event->size().height());
}

const SoEvent * 
MouseHandlerP::mouseMoveEvent(QMouseEvent * event)
{
  MouseHandlerP::setModifiers(this->location2, event);

  assert(this->windowsize[1] != -1);
  SbVec2s pos(event->pos().x(), this->windowsize[1] - event->pos().y() - 1);
  this->location2->setPosition(pos);
  return this->location2;
}

const SoEvent * 
MouseHandlerP::mouseWheelEvent(QWheelEvent * event)
{
  MouseHandlerP::setModifiers(this->mousebutton, event);
  this->mousebutton->setPosition(this->location2->getPosition());

  // QWheelEvent::delta() returns the distance that the wheel is
  // rotated, in eights of a degree. A positive value indicates that
  // the wheel was rotated forwards away from the user; a negative
  // value indicates that the wheel was rotated backwards toward the
  // user.
  (event->delta() > 0) ? 
    this->mousebutton->setButton(SoMouseButtonEvent::BUTTON4):
    this->mousebutton->setButton(SoMouseButtonEvent::BUTTON5);

  return this->mousebutton;
}

const SoEvent * 
MouseHandlerP::mouseButtonEvent(QMouseEvent * event)
{
  MouseHandlerP::setModifiers(this->mousebutton, event);
  this->mousebutton->setPosition(this->location2->getPosition());

  (event->type() == QEvent::MouseButtonPress) ?
    this->mousebutton->setState(SoButtonEvent::DOWN):
    this->mousebutton->setState(SoButtonEvent::UP);
  
  switch (event->button()) {
  case Qt::LeftButton:
    this->mousebutton->setButton(SoMouseButtonEvent::BUTTON1);
    break;
  case Qt::RightButton:
    this->mousebutton->setButton(SoMouseButtonEvent::BUTTON2);
    break;
  case Qt::MidButton:
    this->mousebutton->setButton(SoMouseButtonEvent::BUTTON3);
    break;
  default:
    this->mousebutton->setButton(SoMouseButtonEvent::ANY);
    SoDebugError::postInfo("MouseHandler::mouseButtonEvent",
                           "Unhandled ButtonState = %x", event->button());
    break;
  }
  return this->mousebutton;
}

#undef PRIVATE
