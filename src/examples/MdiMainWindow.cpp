/**************************************************************************\
 * Copyright (c) Kongsberg Oil & Gas Technologies AS
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 * 
 * Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 * 
 * Redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution.
 * 
 * Neither the name of the copyright holder nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
\**************************************************************************/

#include "MdiMainWindow.h"
#include "MdiQuarterWidget.h"

#include <QtGui>
#include <QAction>
#include <QDropEvent>
#include <QCloseEvent>
#include <QMdiArea>
#include <QDragEnterEvent>
#include <QMenuBar>
#include <QFileDialog>
#include <QStatusBar>

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

  if (this->firstwidget == 0) {
    this->firstwidget = (QUARTER_GL_WIDGET *) widget->quarterWidget();
  }

  return widget;
}
