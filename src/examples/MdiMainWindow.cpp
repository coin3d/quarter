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

#include "MdiMainWindow.h"
#include "MdiQuarterWidget.h"

#include <QtGui/QtGui>
#include <QtGui/QAction>
#include <QtGui/QDropEvent>
#include <QtGui/QCloseEvent>
#include <QtGui/QMdiArea>
#include <QtGui/QDragEnterEvent>

#include <Quarter/Quarter.h>

using namespace SIM::Coin3D::Quarter;

MdiMainWindow::MdiMainWindow(void)
{
  Quarter::init();

  this->firstwidget = 0;
  this->mdiarea = new QMdiArea;
  this->setCentralWidget(this->mdiarea);
  this->setAcceptDrops(true);
  this->setWindowTitle(tr("Quarter MDI example"));

  QMenu * filemenu = this->menuBar()->addMenu(tr("&File"));
  QMenu * windowmenu = this->menuBar()->addMenu(tr("&Windows"));

  QAction * fileopenaction = new QAction(tr("&Open"), this);
  QAction * fileexitaction = new QAction(tr("E&xit"), this);
  QAction * tileaction = new QAction(tr("Tile"), this);
  QAction * cascadeaction = new QAction(tr("Cascade"), this);

  filemenu->addAction(fileopenaction);
  filemenu->addAction(fileexitaction);
  windowmenu->addAction(tileaction);
  windowmenu->addAction(cascadeaction);

  this->connect(fileopenaction, SIGNAL(triggered()), this, SLOT(open()));
  this->connect(fileexitaction, SIGNAL(triggered()), qApp, SLOT(closeAllWindows()));
  this->connect(tileaction, SIGNAL(triggered()), this->mdiarea, SLOT(tileSubWindows()));
  this->connect(cascadeaction, SIGNAL(triggered()), this->mdiarea, SLOT(cascadeSubWindows()));
}

MdiMainWindow::~MdiMainWindow()
{
  Quarter::clean();
}

void
MdiMainWindow::dragEnterEvent(QDragEnterEvent * event)
{
  // just accept anything...
  event->acceptProposedAction();
}

void
MdiMainWindow::dropEvent(QDropEvent * event)
{
  const QMimeData * mimedata = event->mimeData();
  if (mimedata->hasUrls()) {
    foreach (QUrl url, mimedata->urls()) {
      this->open(url.path());
    }
  }
}

void
MdiMainWindow::closeEvent(QCloseEvent * event)
{
  this->mdiarea->closeAllSubWindows();
}

void
MdiMainWindow::open(void)
{
  this->open(QFileDialog::getOpenFileName(this));
}

void
MdiMainWindow::open(const QString & filename)
{
  if (!filename.isEmpty()) {
    MdiQuarterWidget * existing = this->findMdiChild(filename);
    if (existing) {
      this->mdiarea->setActiveSubWindow(existing);
      return;
    }
    MdiQuarterWidget * child = this->createMdiChild();
    if (child->loadFile(filename)) {
      this->statusBar()->showMessage(tr("File loaded"), 2000);
      child->show();
    } else {
      child->close();
    }
  }
}

MdiQuarterWidget *
MdiMainWindow::findMdiChild(const QString & filename)
{
  QString canonicalpath = QFileInfo(filename).canonicalFilePath();
  foreach(QMdiSubWindow * window, this->mdiarea->subWindowList()) {
    MdiQuarterWidget * mdiwidget = (MdiQuarterWidget *) window;
    if (mdiwidget->currentFile() == canonicalpath) {
      return mdiwidget;
    }
  }
  return 0;
}

MdiQuarterWidget *
MdiMainWindow::createMdiChild(void)
{
  MdiQuarterWidget * widget = new MdiQuarterWidget(NULL, this->firstwidget);
  this->mdiarea->addSubWindow(widget);

  if (this->firstwidget = 0) {
    this->firstwidget = (QGLWidget *) widget->quarterWidget();
  }

  return widget;
}
