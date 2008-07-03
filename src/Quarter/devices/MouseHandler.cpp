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

#include <QtCore/QEvent>
#include <QtCore/QSize>
#include <QtGui/QMouseEvent>
#include <QtGui/QWheelEvent>
#include <QtGui/QResizeEvent>

#include <Inventor/SbVec2s.h>
#include <Inventor/events/SoEvents.h>
#include <Inventor/errors/SoDebugError.h>

namespace SIM { namespace Coin3D { namespace Quarter {

class MouseHandlerP {
public:
  MouseHandlerP(MouseHandler * publ) {
    this->publ = publ;
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

  class SoLocation2Event * location2;
  class SoMouseButtonEvent * mousebutton;
  SbVec2s windowsize;
  MouseHandler * publ;
};

}}} // namespace

using namespace SIM::Coin3D::Quarter;

#define PRIVATE(obj) obj->pimpl
#define PUBLIC(obj) obj->publ

MouseHandler::MouseHandler(void)
{
  PRIVATE(this) = new MouseHandlerP(this);
}

MouseHandler::~MouseHandler()
{
  delete PRIVATE(this);
}

/*! Translates from QMouseEvents to SoLocation2Events and
  SoMouseButtonEvents
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
MouseHandlerP::resizeEvent(QResizeEvent * event)
{
  this->windowsize = SbVec2s(event->size().width(),
                             event->size().height());
}

const SoEvent *
MouseHandlerP::mouseMoveEvent(QMouseEvent * event)
{
  PUBLIC(this)->setModifiers(this->location2, event);

  assert(this->windowsize[1] != -1);
  SbVec2s pos(event->pos().x(), this->windowsize[1] - event->pos().y() - 1);
  this->location2->setPosition(pos);
  this->mousebutton->setPosition(pos);
  return this->location2;
}

const SoEvent *
MouseHandlerP::mouseWheelEvent(QWheelEvent * event)
{
  PUBLIC(this)->setModifiers(this->mousebutton, event);
  SbVec2s pos(event->pos().x(), this->windowsize[1] - event->pos().y() - 1);
  this->location2->setPosition(pos);
  this->mousebutton->setPosition(pos);

  // QWheelEvent::delta() returns the distance that the wheel is
  // rotated, in eights of a degree. A positive value indicates that
  // the wheel was rotated forwards away from the user; a negative
  // value indicates that the wheel was rotated backwards toward the
  // user.
  (event->delta() > 0) ?
    this->mousebutton->setButton(SoMouseButtonEvent::BUTTON4) :
    this->mousebutton->setButton(SoMouseButtonEvent::BUTTON5);

  this->mousebutton->setState(SoButtonEvent::DOWN);
  return this->mousebutton;
}

const SoEvent *
MouseHandlerP::mouseButtonEvent(QMouseEvent * event)
{
  PUBLIC(this)->setModifiers(this->mousebutton, event);
  SbVec2s pos(event->pos().x(), this->windowsize[1] - event->pos().y() - 1);
  this->location2->setPosition(pos);
  this->mousebutton->setPosition(pos);

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
#undef PUBLIC
