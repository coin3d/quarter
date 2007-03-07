/**************************************************************************\
 *
 *  This file is part of the SIM Quarter extension library for Coin.
 *  Copyright (C) 1998-2005 by Systems in Motion.  All rights reserved.
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

#include <Quarter/devices/MouseHandler.h>

#include <QEvent>
#include <QSize>
#include <QMouseEvent>
#include <QWheelEvent>
#include <QResizeEvent>
#include <Inventor/events/SoEvents.h>
#include <Inventor/errors/SoDebugError.h>

MouseHandler::MouseHandler(void)
{
  this->location2 = new SoLocation2Event;
  this->mousebutton = new SoMouseButtonEvent;
  this->windowsize = SbVec2s(-1, -1);
}

MouseHandler::~MouseHandler()
{
  delete this->location2;
  delete this->mousebutton;
}

const SoEvent * 
MouseHandler::translateEvent(QEvent * event)
{
  switch (event->type()) {
  case QEvent::MouseMove:
    return this->mouseMoveEvent((QMouseEvent *) event);
  case QEvent::MouseButtonPress:
  case QEvent::MouseButtonRelease:
    return this->mouseButtonEvent((QMouseEvent *) event);
  case QEvent::Wheel:
    return this->mouseWheelEvent((QWheelEvent *) event);
  case QEvent::Resize:
    this->resizeEvent((QResizeEvent *) event);
    return NULL;
  default:
    return NULL;
  }
}

static void set_modifiers(SoEvent * soevent, QInputEvent * qevent)
{
  // FIXME: How do we get the time from the qevent? (20070306 frodo)
  soevent->setTime(SbTime::getTimeOfDay());
  soevent->setShiftDown(qevent->modifiers() & Qt::ShiftModifier);
  soevent->setCtrlDown(qevent->modifiers() & Qt::ControlModifier);
  soevent->setAltDown(qevent->modifiers() & Qt::AltModifier);
}

void 
MouseHandler::resizeEvent(QResizeEvent * event)
{
  this->windowsize = SbVec2s(event->size().width(),
                             event->size().height());
}

const SoEvent * 
MouseHandler::mouseMoveEvent(QMouseEvent * event)
{
  set_modifiers(this->location2, event);

  assert(this->windowsize[1] != -1);
  SbVec2s pos(event->pos().x(), this->windowsize[1] - event->pos().y() - 1);
  this->location2->setPosition(pos);
  return this->location2;
}

const SoEvent * 
MouseHandler::mouseWheelEvent(QWheelEvent * event)
{
  set_modifiers(this->mousebutton, event);

  this->mousebutton->setPosition(this->location2->getPosition());

  // QWheelEvent::delta() returns the distance that the wheel is
  // rotated, in eights of a degree. A positive value indicates that
  // the wheel was rotated forwards away from the user; a negative
  // value indicates that the wheel was rotated backwards toward the
  // user.
  (event->delta() > 0) ? 
    this->mousebutton->setButton(SoMouseButtonEvent::BUTTON4) :
    this->mousebutton->setButton(SoMouseButtonEvent::BUTTON5);

  return this->mousebutton;
}

const SoEvent * 
MouseHandler::mouseButtonEvent(QMouseEvent * event)
{
  set_modifiers(this->mousebutton, event);

  this->mousebutton->setPosition(this->location2->getPosition());
  this->mousebutton->setState(event->type() == QEvent::MouseButtonPress ?
                              SoButtonEvent::DOWN :
                              SoButtonEvent::UP);
  
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
