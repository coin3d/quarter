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
  \page examiner Examiner type Viewer

  This example demonstrate how to create a simple viewer that can load
  Inventor files
*/

#include <QtGui/QApplication>
#include <QtUiTools/QUiLoader>
#include <QtCore/QFile>

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
  QuarterWidget * viewer = qFindChild<QuarterWidget *>(widget, "QuarterWidget");
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
