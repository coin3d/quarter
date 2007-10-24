/**************************************************************************\
 *
 *  This file is part of the SIM Quarter extension library for Coin.
 *  Copyright (C) 1998-2007 by Systems in Motion.  All rights reserved.
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
  \page dynamicui Dynamic Loading
  
  This example demonstrate how to dynamically load a QuarterWidget
  from a Qt Designer ui file.
*/

#include <QUiLoader>
#include <QtCore/QFile>

#include <Inventor/nodes/SoCone.h>
#include <Inventor/nodes/SoBaseColor.h>
#include <Inventor/nodes/SoSeparator.h>

#include <Quarter/QuarterWidget.h>
#include <Quarter/QuarterApplication.h>

using namespace SIM::Coin3D::Quarter;

int main(int argc, char *argv[])
{
  QuarterApplication app(argc, argv);

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

  // Make a dead simple scene graph by using the Coin library, only
  // containing a single yellow cone under the scenegraph root.
  SoSeparator * root = new SoSeparator;
  root->ref();
  
  SoBaseColor * col = new SoBaseColor;
  col->rgb = SbColor(1, 1, 0);
  root->addChild(col);

  root->addChild(new SoCone);
  viewer->setSceneGraph(root);
  
  // Pop up the QuarterWidget
  widget->show();
  // Loop until exit.
  app.exec();
  // Clean up resources.
  root->unref();
  delete widget;
  
  return 0;
}
