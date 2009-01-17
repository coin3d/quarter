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
  \page directui A Direct Approach

  This example demonstrate how to create a simple viewer without
  subclassing the class generated from the ui file

*/

#include <Inventor/nodes/SoCone.h>
#include <Inventor/nodes/SoBaseColor.h>
#include <Inventor/nodes/SoSeparator.h>

#include <QtGui/QApplication>
#include <Quarter/QuarterWidget.h>
#include <Quarter/Quarter.h>

#include "ui_QuarterViewer.h"

using namespace SIM::Coin3D::Quarter;

int
main(int argc, char ** argv)
{
  QApplication app(argc, argv);
  // Initializes Quarter (and implicitly also Coin and Qt
  Quarter::init();

  QWidget * viewer = new QWidget;
  Ui::QuarterViewer ui;
  ui.setupUi(viewer);

  // Make a dead simple scene graph by using the Coin library, only
  // containing a single yellow cone under the scenegraph root.
  SoSeparator * root = new SoSeparator;
  root->ref();

  SoBaseColor * col = new SoBaseColor;
  col->rgb = SbColor(1, 1, 0);
  root->addChild(col);

  root->addChild(new SoCone);

  // Create a QuarterWidget for displaying a Coin scene graph
  ui.QuarterWidget->setSceneGraph(root);

  // Pop up the QuarterWidget
  viewer->show();
  // Loop until exit.
  app.exec();
  // Clean up resources.
  root->unref();
  delete viewer;
  Quarter::clean();

  return 0;
}
