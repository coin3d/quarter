#ifndef MDI_QUARTER_WIDGET_H
#define MDI_QUARTER_WIDGET_H

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

#include <QtCore/QSize>
#include <QtGui/QMdiSubWindow>

namespace SIM { namespace Coin3D { namespace Quarter {
  class QuarterWidget;
}}}

class QString;
class QGLWidget;
using namespace SIM::Coin3D::Quarter;

class MdiQuarterWidget : public QMdiSubWindow {
  typedef QMdiSubWindow inherited;
public:
  MdiQuarterWidget(QWidget * parent = 0, const QGLWidget * sharewidget = 0);
  ~MdiQuarterWidget();

  bool loadFile(const QString & filename);
  const QString & currentFile(void) const;
  const QuarterWidget * quarterWidget(void) const;

  virtual QSize minimumSizeHint(void) const;

protected:
  virtual void closeEvent(QCloseEvent * event);

private:
  QString currentfile;
  QuarterWidget * quarterwidget;
};

#endif // MDI_QUARTER_WIDGET_H
