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

#include "MdiQuarterWidget.h"

#include <QtGui/QLayout>
#include <Quarter/QuarterWidget.h>
#include <Quarter/eventhandlers/DragDropHandler.h>
using namespace SIM::Coin3D::Quarter;

#include <Inventor/SoInput.h>
#include <Inventor/nodes/SoSeparator.h>

MdiQuarterWidget::MdiQuarterWidget(QWidget * parent, const QGLWidget * sharewidget)
  : inherited(parent)
{
  this->quarterwidget = new QuarterWidget(this, sharewidget);
  this->quarterwidget->installEventFilter(new DragDropHandler(this->quarterwidget));
  //set default navigation mode file
  this->quarterwidget->setNavigationModeFile();
  this->layout()->addWidget(this->quarterwidget);
}

MdiQuarterWidget::~MdiQuarterWidget()
{
  if (this->quarterwidget) {
    delete this->quarterwidget;
  }
}

const QuarterWidget *
MdiQuarterWidget::quarterWidget(void) const
{
  return this->quarterwidget;
}

bool
MdiQuarterWidget::loadFile(const QString & filename)
{
  SoInput in;
  if (in.openFile(filename.toLatin1().constData())) {
    SoSeparator * root = SoDB::readAll(&in);
    if (root) {
      this->quarterwidget->setSceneGraph(root);
      this->currentfile = filename;
      this->setWindowTitle(filename);
      return true;
    }
  }
  return false;
}

const QString &
MdiQuarterWidget::currentFile(void) const
{
  return this->currentfile;
}

QSize
MdiQuarterWidget::minimumSizeHint(void) const
{
  return QSize(640, 480);
}

void
MdiQuarterWidget::closeEvent(QCloseEvent * event)
{
  delete this->quarterwidget;
  this->quarterwidget = NULL;
}
