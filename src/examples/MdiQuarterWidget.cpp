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

#include "MdiQuarterWidget.h"

#include <QLayout>
#include <Quarter/QuarterWidget.h>
#include <Quarter/eventhandlers/DragDropHandler.h>
using namespace SIM::Coin3D::Quarter;

#include <Inventor/SoInput.h>
#include <Inventor/nodes/SoSeparator.h>

MdiQuarterWidget::MdiQuarterWidget(QWidget * parent, const QUARTER_GL_WIDGET * sharewidget)
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
  delete this->quarterwidget;
  this->quarterwidget = NULL;
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
