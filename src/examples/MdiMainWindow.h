#ifndef QUARTER_MDI_MAINWINDOW_H
#define QUARTER_MDI_MAINWINDOW_H

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


#include <QtGui/QMainWindow>

class QString;
class QGLWidget;
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
  QGLWidget * firstwidget; // for context sharing
};

#endif // QUARTER_MDI_MAINWINDOW_H
