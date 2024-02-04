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

/*!
  \page QuarterWidgetPlugin Qt Designer Plugin

  The QuarterWidgetPlugin installs in $QTDIR/plugins/designer where it
  will be automatically picked up by Qt Designer.
*/

#include "QuarterWidgetPlugin.h"

#include <QtPlugin>
#include <QtDesigner/QDesignerActionEditorInterface>
#include <QtDesigner/QDesignerFormEditorInterface>
#include <QList>
#include <QActionGroup>

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
  QUARTER_GL_WIDGET* firstwidget; // for context sharing
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

  \brief The QuarterWidgetPlugin makes the QuarterWidget available to Qt Designer.
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
  \retval bool whether the initialize function has been called at least once.
*/
bool
QuarterWidgetPlugin::isInitialized(void) const
{
  return PRIVATE(this)->initialized;
}

/*!
  Creates a QuarterWidget initialized for the form loader

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
    "<ui language=\"c++\">\n"
    " <widget class=\"SIM::Coin3D::Quarter::QuarterWidget\" \
              name=\"quarterWidget\">\n"
    "  <property name=\"geometry\">\n"
    "   <rect>\n"
    "    <x>0</x>\n"
    "    <y>0</y>\n"
    "    <width>100</width>\n"
    "    <height>100</height>\n"
    "   </rect>\n"
    "  </property>\n"
    " </widget>\n"
    "</ui>\n";
}

/*!
  See \ref QDesignerCustomWidgetInterface::includeFile
*/
QString
QuarterWidgetPlugin::includeFile(void) const
{
  return "Quarter/QuarterWidget.h";
}

#if QT_VERSION < 0x050000
Q_EXPORT_PLUGIN2(quarterwidget, QuarterWidgetPlugin)
#endif

#undef PRIVATE
