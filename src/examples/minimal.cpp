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
  This example shows a minimal stand-alone
  example of a QuarterViewer without the use of ui files
 */

#include <Inventor/nodes/SoCone.h>
#include <Inventor/nodes/SoComplexity.h>
#include <Inventor/nodes/SoCoordinate4.h>
#include <Inventor/nodes/SoNurbsCurve.h>
#include <Inventor/nodes/SoBaseColor.h>
#include <Inventor/nodes/SoSeparator.h>

#include <Quarter/Quarter.h>
#include <Quarter/QuarterWidget.h>

#include <QtGui/QApplication>
#include <QtGui/QMainWindow>

using namespace SIM::Coin3D::Quarter;

static SoSeparator *
createSurface()

{

       SoSeparator* sep_spline = new SoSeparator();

       sep_spline->ref();



       float pts[7][4] = {

             {0.0, -5.0, 0.0, 1.0},

             {2.5, -2.5, 0.0, 0.5},

             {2.5, -0.66987, 0.0, 1.0},

             {0.0, 1.94013, 0.0, 0.5},

             {-2.5, -0.66987, 0.0, 1.0},

             {-2.5, -2.5, 0.0, 0.5},

             {0.0, -5.0, 0.0, 1.0}

       };

       float knots[10] = {0.0, 0.0, 0.0, 1.0, 1.0, 2.0, 2.0, 3.0, 3.0, 3.0};



       SoComplexity *complexity = new SoComplexity;

       SoCoordinate4 *controlPts = new SoCoordinate4;

       SoNurbsCurve *curve = new SoNurbsCurve;



       complexity->value.setValue(1.0);



       controlPts->point.setValues(0,7,pts);

       curve->numControlPoints = 7;

       curve->knotVector.setValues(0, 10, knots);

       sep_spline->addChild(complexity);

       sep_spline->addChild(controlPts);

       sep_spline->addChild(curve);

       sep_spline->unrefNoDelete();

       return sep_spline;

}

int
main(int argc, char ** argv)
{
  QApplication app(argc, argv);
  // Initializes Quarter (and implicitly also Coin and Qt
  Quarter::init();

  // Make a dead simple scene graph by using the Coin library, only
  // containing a single yellow cone under the scenegraph root.
  //SoSeparator * root = new SoSeparator;
  SoSeparator * root = createSurface();
  root->ref();

  SoBaseColor * col = new SoBaseColor;
  col->rgb = SbColor(1, 1, 0);
  root->addChild(col);

  //root->addChild(new SoCone);

  QMainWindow * mainwin = new QMainWindow();

  // Create a QuarterWidget for displaying a Coin scene graph
  QuarterWidget * viewer = new QuarterWidget(mainwin);
  //set default navigation mode file
  viewer->setNavigationModeFile();
  mainwin->setCentralWidget(viewer);
  viewer->setSceneGraph(root);

  // Pop up the QuarterWidget
  mainwin->show();
  // Loop until exit.
  app.exec();
  // Clean up resources.
  root->unref();
  delete viewer;

  Quarter::clean();

  return 0;
}
