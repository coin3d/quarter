#ifndef QUARTER_MDI_MAINWINDOW_H
#define QUARTER_MDI_MAINWINDOW_H

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


#include <QMainWindow>

class QString;
#if QT_VERSION >= 0x060000
#define QUARTER_GL_WIDGET QOpenGLWidget
#else
#define QUARTER_GL_WIDGET QGLWidget
#endif
class QUARTER_GL_WIDGET;
class QMdiArea;
class QDropEvent;
class QCloseEvent;
class MdiQuarterWidget;

class MdiMainWindow : public QMainWindow {
  typedef QMainWindow inherited;
  Q_OBJECT

public:
  MdiMainWindow(void);
  ~MdiMainWindow();

protected:
  virtual void closeEvent(QCloseEvent * event);
  virtual void dragEnterEvent(QDragEnterEvent * event);
  virtual void dropEvent(QDropEvent * event);

private slots:
  void open(void);
  void open(const QString & filename);

private:
  MdiQuarterWidget * activeMdiChild(void);
  MdiQuarterWidget * createMdiChild(void);
  MdiQuarterWidget * findMdiChild(const QString & filename);

  QMdiArea * mdiarea;
  QUARTER_GL_WIDGET * firstwidget; // for context sharing
};

#endif // QUARTER_MDI_MAINWINDOW_H
