#ifndef QUARTER_QUARTERWIDGETPLUGIN_H
#define QUARTER_QUARTERWIDGETPLUGIN_H

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

#include <QDesignerCustomWidgetInterface>

namespace SIM { namespace Coin3D { namespace Quarter { namespace QtDesigner {

class QuarterWidgetPlugin : public QObject,
                            public QDesignerCustomWidgetInterface {
  Q_OBJECT
  Q_INTERFACES(QDesignerCustomWidgetInterface)

public:
  QuarterWidgetPlugin(QObject * parent = 0);
  ~QuarterWidgetPlugin();

  bool isContainer(void) const;
  bool isInitialized(void) const;
  QIcon icon(void) const;
  QString domXml(void) const;
  QString group(void) const;
  QString includeFile(void) const;
  QString name(void) const;
  QString toolTip(void) const;
  QString whatsThis(void) const;
  QWidget * createWidget(QWidget * parent);
  void initialize(QDesignerFormEditorInterface * core);

private slots:
  void widgetDestroyed(QObject * obj);

private:
  class QuarterWidgetPluginP * pimpl;
};

}}}} // namespace

#endif // QUARTER_QUARTERWIDGETPLUGIN_H
