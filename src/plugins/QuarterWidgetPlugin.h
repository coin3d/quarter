#ifndef QUARTER_QUARTERWIDGETPLUGIN_H
#define QUARTER_QUARTERWIDGETPLUGIN_H

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

#include <QtCore/qglobal.h>

#if QT_VERSION >= 0x050000
#  include <QtUiPlugin/QDesignerCustomWidgetInterface>
#else
#  include <QDesignerCustomWidgetInterface>
#endif

namespace SIM { namespace Coin3D { namespace Quarter { namespace QtDesigner {

class QuarterWidgetPlugin : public QObject,
                            public QDesignerCustomWidgetInterface {
  Q_OBJECT
#if QT_VERSION >= 0x050000
  Q_PLUGIN_METADATA(IID "org.coin3d.Qt.QDesignerCustomWidgetInterface")
#endif
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
