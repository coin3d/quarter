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

#include <Quarter/devices/DragDropHandler.h>

#include <QUrl>
#include <QList>
#include <QFileInfo>
#include <QDragEnterEvent>
#include <QDropEvent>

#include <Inventor/SoInput.h>
#include <Inventor/nodes/SoSeparator.h>

#include <Quarter/CoinWidget.h>
#include <Quarter/devices/DeviceManager.h>
#include <stdlib.h>

DragDropHandler::DragDropHandler(void)
{
  this->suffixes << "iv" << "wrl";
}

DragDropHandler::~DragDropHandler()
{
  
}

const SoEvent * 
DragDropHandler::translateEvent(QEvent * event)
{
  switch (event->type()) {
  case QEvent::DragEnter:
    this->dragEnterEvent((QDragEnterEvent *) event);
    break;
  case QEvent::Drop:
    this->dropEvent((QDropEvent *) event);
    break;
  default:
    break;
  }
  return NULL;
}
  
void 
DragDropHandler::dragEnterEvent(QDragEnterEvent * event)
{
  const QMimeData * mimedata = event->mimeData();
  if (!mimedata->hasUrls()) { return; }
   
 QFileInfo fileinfo(mimedata->urls().takeFirst().path());
  QString suffix = fileinfo.suffix().toLower();
  if (!this->suffixes.contains(suffix)) { return; }
  
  event->acceptProposedAction();
}

void 
DragDropHandler::dropEvent(QDropEvent * event)
{
  const QMimeData * mimedata = event->mimeData();
  if (!mimedata->hasUrls()) { return; }
  
  QString path = mimedata->urls().takeFirst().path();
  
  // attempt to open file
  SoInput in;
  SbBool ok = in.openFile(path.toLatin1().constData());
  if (!ok) { return; }
  
  // attempt to import it
  SoSeparator * root = SoDB::readAll(&in);
  if (root == NULL) { return; }

  // get CoinWidget
  CoinWidget * coinwidget = (CoinWidget *) this->manager->getWidget();
  coinwidget->setSceneGraph(root);
  coinwidget->updateGL();
}
