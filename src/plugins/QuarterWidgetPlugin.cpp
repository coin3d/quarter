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

/*!
  \page QuarterWidgetPlugin Qt Designer Plugin

  The QuarterWidgetPlugin installs in $QTDIR/plugins/designer where it
  will be automatically picked up by Qt Designer.
*/

#include "QuarterWidgetPlugin.h"

#include <QtCore/QtPlugin>
#include <QtDesigner/QDesignerActionEditorInterface>
#include <QtDesigner/QDesignerFormEditorInterface>
#include <QtCore/QList>
#include <QtGui/QActionGroup>

#include <Inventor/nodes/SoCube.h>
#include <Quarter/Quarter.h>
#include <Quarter/QuarterWidget.h>

#ifndef DOXYGEN_SKIP_THIS

namespace SIM { namespace Coin3D { namespace Quarter { namespace QtDesigner {

class QuarterWidgetPluginP {
public:
  QuarterWidgetPluginP(void) {}
  bool initialized;
  bool manageactions;
  QGLWidget * firstwidget; // for context sharing
  QDesignerFormEditorInterface * formeditor;
  QList<QAction *> transparencytypeactions;
};

}}}} // namespace



#define PRIVATE(obj) obj->pimpl

#endif // DOXYGEN_SKIP_THIS

using namespace SIM::Coin3D::Quarter;
using namespace SIM::Coin3D::Quarter::QtDesigner;

/*!
  \class SIM::Coin3D::Quarter::QtDesigner::QuarterWidgetPlugin QuarterWidgetPlugin.h

  \brief The QuarterWidgetPlugin makes the QuarterWidget available to QT designer.
*/

/*!
  \brief constructor
*/
QuarterWidgetPlugin::QuarterWidgetPlugin(QObject * parent)
  : QObject(parent)
{
  PRIVATE(this) = new QuarterWidgetPluginP;
  PRIVATE(this)->initialized = false;
  PRIVATE(this)->manageactions = true;
  PRIVATE(this)->firstwidget = 0;
  PRIVATE(this)->formeditor = 0;
}

/*!
  destructor
 */
QuarterWidgetPlugin::~QuarterWidgetPlugin()
{
  delete PRIVATE(this);
}

/*!
  Initializes the plugin

  \see QDesignerFormEditorInterface::initialize
*/
void
QuarterWidgetPlugin::initialize(QDesignerFormEditorInterface * formeditor)
{
  if (PRIVATE(this)->initialized) {
    return;
  }

  Quarter::init();

  PRIVATE(this)->formeditor = formeditor;
  PRIVATE(this)->initialized = true;

}

/*!
  \retval bool wether the initalize function has been called at least once.
*/
bool
QuarterWidgetPlugin::isInitialized(void) const
{
  return PRIVATE(this)->initialized;
}

/*!
  Creates a QuarterWidget initialized for the formloader

  \see QDesignerFormEditorInterface::createWidget
*/
QWidget *
QuarterWidgetPlugin::createWidget(QWidget * parent)
{
  QuarterWidget * widget = new QuarterWidget(parent, PRIVATE(this)->firstwidget);
  if (PRIVATE(this)->firstwidget == 0) {
    PRIVATE(this)->firstwidget = widget;
    QObject::connect(widget, SIGNAL(destroyed(QObject*)),
                     this, SLOT(widgetDestroyed(QObject*)));
  }

  //Make a reasonable default visible in designer
  widget->setNavigationModeFile();

#if 0
  // Exposing actions to Qt Designer seems to be too buggy to be
  // useful at the moment. On Mac OS X, when adding the actions to the
  // menu, the text is not visible. On Windows, the text is visible,
  // but the actions are not grouped, and does not display their
  // checked/unchecked state. The grouping appears to be the
  // problem. In addition to this, any UI file containing actions
  // added this way seems to crash Qt Designer on both
  // platforms. (20081215 frodo)

  // expose actions to Qt Designer
  if (PRIVATE(this)->formeditor) {
    QDesignerActionEditorInterface * actioneditor =
      PRIVATE(this)->formeditor->actionEditor();

    if (actioneditor && PRIVATE(this)->manageactions) {
      foreach (QAction * action, widget->transparencyTypeActions()) {
        actioneditor->manageAction(action);
      }
      foreach (QAction * action, widget->renderModeActions()) {
        actioneditor->manageAction(action);
      }
      foreach (QAction * action, widget->stereoModeActions()) {
        actioneditor->manageAction(action);
      }
      PRIVATE(this)->manageactions = false;
    }
  }
#endif
  widget->setSceneGraph(new SoCube);
  return widget;
}

/*!
  Name of the widget

  \see QDesignerCustomWidgetInterface::name
*/
QString
QuarterWidgetPlugin::name(void) const
{
  return "SIM::Coin3D::Quarter::QuarterWidget";
}

/*!
  See \ref QDesignerCustomWidgetInterface::group
*/
QString
QuarterWidgetPlugin::group(void) const
{
  return "Display Widgets [Coin3D]";
}

/*!
  See \ref QDesignerCustomWidgetInterface::icon
*/
QIcon
QuarterWidgetPlugin::icon(void) const
{
  return QIcon(":/coinlogo.png");
}

/*!
  See \ref QDesignerCustomWidgetInterface::toolTip
*/
QString
QuarterWidgetPlugin::toolTip(void) const
{
  return "";
}

/*!
  See \ref QDesignerCustomWidgetInterface::whatsThis
*/
QString
QuarterWidgetPlugin::whatsThis(void) const
{
  return "";
}

/*!
  See \ref QDesignerCustomWidgetInterface::isContainer
*/
bool
QuarterWidgetPlugin::isContainer(void) const
{
  return false;
}

void
QuarterWidgetPlugin::widgetDestroyed(QObject * obj)
{
  QuarterWidget * widget = (QuarterWidget*) obj;
  if (widget == PRIVATE(this)->firstwidget) PRIVATE(this)->firstwidget = NULL;
}

/*!
  See \ref QDesignerCustomWidgetInterface::domXml
*/
QString
QuarterWidgetPlugin::domXml(void) const
{

  return
    "<widget class=\"SIM::Coin3D::Quarter::QuarterWidget\" \
             name=\"quarterWidget\">\n"
    " <property name=\"geometry\">\n"
    "  <rect>\n"
    "   <x>0</x>\n"
    "   <y>0</y>\n"
    "   <width>100</width>\n"
    "   <height>100</height>\n"
    "  </rect>\n"
    " </property>\n"
    "</widget>\n";
}

/*!
  See \ref QDesignerCustomWidgetInterface::includeFile
*/
QString
QuarterWidgetPlugin::includeFile(void) const
{
  return "Quarter/QuarterWidget.h";
}

Q_EXPORT_PLUGIN2(quarterwidget, QuarterWidgetPlugin)

#undef PRIVATE
