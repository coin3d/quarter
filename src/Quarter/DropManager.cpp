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
  \class SIM::Coin3D::Quarter::DropManager DropManager.h Quarter/DropManager.h

  \brief The DropManager is an eventhandler interface for Quarter
  which handles drag and drop(D&D) events.
*/

#include <Quarter/QuarterWidget.h>
#include <Quarter/DropManager.h>
#include <QDropEvent>

using namespace SIM::Coin3D::Quarter;

/*!
  Checks if an event can be handled by this manager
  
  \param event must set acceptProposedAction() if accepted, should
  do nothing if not accepted
*/
void DropManager::accept(QDragEnterEvent * event) {}
       
/*!
  Handling of dropevent
  
  \param event must set acceptProposedAction() if successfully
  handled, should do nothing if not accepted
*/
void DropManager::drop(QDropEvent * event) {}
       
/*!
  Handles any move action within the window
  
  \param event must set acceptProposedAction() if successfully
  handled, should do nothing if not accepted
*/
void DropManager::move(QDragMoveEvent * event) {}
       
/*!
  Handles when a dragger leaves the window
  
  \param event must set acceptProposedAction() if successfully
  handled, should do nothing if not accepted
*/
void DropManager::stopMove(QDragLeaveEvent * event) {}

/*!
  The eventfilter listen for events relevant for D&D handling, but
  does not remove them from the regular handling.
*/
bool DropManager::eventFilter(QObject *obj, QEvent *event)
{
  switch (event->type()) {
  case QEvent::DragMove:
    this->move(dynamic_cast<QDragMoveEvent*>(event));
    break;
  case QEvent::DragEnter:
    this->accept(dynamic_cast<QDragEnterEvent*>(event));
    break;
  case QEvent::Drop:
    this->drop(dynamic_cast<QDropEvent*>(event));
    if (event->isAccepted())
      emit(dynamic_cast<QuarterWidget*>(obj)->drop());
    break;
  case QEvent::DragLeave:
    this->stopMove(dynamic_cast<QDragLeaveEvent*>(event));
    break;
  default:
    // standard event processing
    return QObject::eventFilter(obj, event);
  }
  
  QObject::eventFilter(obj, event);
  return true;
}
