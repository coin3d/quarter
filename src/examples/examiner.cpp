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
  \page examiner Examiner type Viewer

  This example demonstrate how to create a simple viewer that can load
  Inventor files
*/

#include <QApplication>
#include <QUiLoader>
#include <QFile>

#include <Inventor/nodes/SoCone.h>
#include <Inventor/nodes/SoBaseColor.h>
#include <Inventor/nodes/SoSeparator.h>

#include <Quarter/Quarter.h>
#include <Quarter/QuarterWidget.h>
#include <Quarter/eventhandlers/DragDropHandler.h>

using namespace SIM::Coin3D::Quarter;

int main(int argc, char *argv[])
{
  QApplication app(argc, argv);
  Quarter::init();

  QFile file(":/QuarterViewer.ui");
  if (!file.open(QFile::ReadOnly)) {
    assert(0 && "could not open ui file");
  }
  QUiLoader loader;
  QWidget * widget = loader.load(&file);
  assert(widget);
  file.close();

  // Get the QuarterWidget
  QuarterWidget * viewer = widget->findChild<QuarterWidget *>("QuarterWidget");
  assert(viewer && "could not find child QuarterWidget in ui file");

  // make viewer support drag and drop of Inventor files
  viewer->installEventFilter(new DragDropHandler(viewer));

  // Make a dead simple scene graph by using the Coin library, only
  // containing a single yellow cone under the scenegraph root.
  SoSeparator * root = NULL;

  if (argc < 2) {
    root = new SoSeparator;
    root->addChild(new SoCone);
  } else {
    // Open the argument file..
    SoInput in;
    SbBool ok = in.openFile(argv[1]);
    if (!ok) {
      qWarning("could not open file %s\n", argv[1]);
      exit(1);
    }

    // ..and import it.
    root = SoDB::readAll(&in);
  }

  if (root == NULL) {
    qWarning("could not read file %s\n", argv[1]);
    exit(1);
  }

  root->ref();

  viewer->setSceneGraph(root);

  // Pop up the QuarterWidget
  widget->show();
  // Loop until exit.
  app.exec();
  // Clean up resources.
  root->unref();
  delete widget;
  Quarter::clean();

  return 0;
}
