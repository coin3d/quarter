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

#include "CoinWidgetPlugin.h"

#include <QtPlugin>
#include <Inventor/nodes/SoCube.h>
#include <Quarter/Quarter.h>
#include <Quarter/CoinWidget.h>

class CoinWidgetPluginP {
public:
  CoinWidgetPluginP(void) {}
  bool initialized;
};

#define PRIVATE(obj) obj->pimpl

CoinWidgetPlugin::CoinWidgetPlugin(QObject * parent)
  : QObject(parent)
{
  PRIVATE(this) = new CoinWidgetPluginP;
  PRIVATE(this)->initialized = false;
}

CoinWidgetPlugin::~CoinWidgetPlugin()
{
  delete PRIVATE(this);
}

void 
CoinWidgetPlugin::initialize(QDesignerFormEditorInterface *)
{
  if (PRIVATE(this)->initialized) {
    return;
  }

  Quarter::init();
  PRIVATE(this)->initialized = true;
}

bool 
CoinWidgetPlugin::isInitialized(void) const
{
  return PRIVATE(this)->initialized;
}

QWidget *
CoinWidgetPlugin::createWidget(QWidget * parent)
{
  CoinWidget * widget = new CoinWidget(parent);
  widget->setSceneGraph(new SoCube);
  return widget;
}

QString 
CoinWidgetPlugin::name(void) const
{
  return "CoinWidget";
}

QString 
CoinWidgetPlugin::group(void) const
{
  return "Display Widgets [Coin3D]";
}

QIcon
CoinWidgetPlugin::icon(void) const
{
  return QIcon();
}

QString 
CoinWidgetPlugin::toolTip(void) const
{
  return "";
}

QString 
CoinWidgetPlugin::whatsThis(void) const
{
  return "";
}

bool 
CoinWidgetPlugin::isContainer(void) const
{
  return false;
}

QString 
CoinWidgetPlugin::domXml(void) const
{
  return "<widget class=\"CoinWidget\" name=\"CoinWidget\">\n"
    " <property name=\"geometry\">\n"
    "  <rect>\n"
    "   <x>0</x>\n"
    "   <y>0</y>\n"
    "   <width>100</width>\n"
    "   <height>100</height>\n"
    "  </rect>\n"
    " </property>\n"
    " <property name=\"toolTip\" >\n"
    "  <string>CoinWidget</string>\n"
    " </property>\n"
    " <property name=\"whatsThis\" >\n"
    "  <string>The CoinWidget displays Open Inventor scene graphs.</string>\n"
    " </property>\n"
    "</widget>\n";
}

QString 
CoinWidgetPlugin::includeFile(void) const
{
  return "CoinWidget.h";
}

Q_EXPORT_PLUGIN2(coinwidget, CoinWidgetPlugin)

#undef PRIVATE
