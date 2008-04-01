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
  \class SIM::Coin3D::Quarter::ContextMenuHandler ContextMenuHandler.h Quarter/devices/ContextMenuHandler.h

  \brief The ContextMenuHandler handles the context menu on the
  QuarterWidget. It is not registered with the DeviceManager by default.
*/

#include <Quarter/eventhandlers/ContextMenuHandler.h>

#include <QtCore/QEvent>
#include <QtGui/QContextMenuEvent>
#include <Inventor/events/SoEvents.h>
#include <Quarter/eventhandlers/EventManager.h>

#include "ContextMenu.h"

namespace SIM { namespace Coin3D { namespace Quarter {

class ContextMenuHandlerP {
public:
  ContextMenu * contextmenu;
};

}}} // namespace

using namespace SIM::Coin3D::Quarter;

#define PRIVATE(obj) obj->pimpl

ContextMenuHandler::ContextMenuHandler(void)
{
  PRIVATE(this) = new ContextMenuHandlerP;
  PRIVATE(this)->contextmenu = NULL;
}

ContextMenuHandler::~ContextMenuHandler()
{
  if (PRIVATE(this)->contextmenu) {
    delete PRIVATE(this)->contextmenu;
  }
  delete PRIVATE(this);
}

QMenu * 
ContextMenuHandler::getContextMenu(void) const
{
  if (!PRIVATE(this)->contextmenu) {
    PRIVATE(this)->contextmenu = new ContextMenu(this->manager->getWidget());
  }
  return PRIVATE(this)->contextmenu->getMenu();
}

bool
ContextMenuHandler::handleEvent(QEvent * event)
{
  if (event->type() == QEvent::ContextMenu) {
    (void) this->getContextMenu(); // make sure a context menu is created
    return PRIVATE(this)->contextmenu->contextMenuEvent((QContextMenuEvent *)event);
  }
  return false;
}

#undef PRIVATE
