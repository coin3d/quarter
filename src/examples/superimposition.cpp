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
  This example shows a minimal stand-alone
  example of a QuarterViewer without the use of ui files
 */

#include <QtGui/QApplication>

#include <Inventor/nodes/SoCone.h>
#include <Inventor/nodes/SoBaseColor.h>
#include <Inventor/nodes/SoSeparator.h>
#include <Inventor/nodes/SoOrthographicCamera.h>
#include <Inventor/nodes/SoText2.h>
#include <Inventor/nodes/SoTranslation.h>
#include <Inventor/SoRenderManager.h>

#include <Quarter/QuarterWidget.h>
#include <Quarter/Quarter.h>

using namespace SIM::Coin3D::Quarter;

static SoSeparator * create_background(void)
{
  SoSeparator * root = new SoSeparator;
  SoText2 * text = new SoText2;
  SoBaseColor * color = new SoBaseColor;
  SoOrthographicCamera * orthocam = new SoOrthographicCamera;

  text->string.setValue("Background Scene");
  color->rgb.setValue(SbColor(1.0, 0.0, 0.0));

  orthocam->height.setValue(1.0);
  orthocam->nearDistance.setValue(0.0);
  orthocam->farDistance.setValue(2.0);
  orthocam->position = SbVec3f(0.0f, 0.2f, 1.0f);

  root->addChild(orthocam);
  root->addChild(color);
  root->addChild(text);

  return root;

}

// create a simple scene displaying some text to be super-imposed on
// the normal scene graph
static SoSeparator * create_superimposition(void)
{
  SoSeparator * root = new SoSeparator;
  SoText2 * text = new SoText2;
  SoBaseColor * color = new SoBaseColor;
  SoOrthographicCamera * orthocam = new SoOrthographicCamera;

  text->string.setValue("Superimposed Scene");
  color->rgb.setValue(SbColor(1.0, 0.0, 0.0));

  orthocam->height.setValue(1.0);
  orthocam->nearDistance.setValue(0.0);
  orthocam->farDistance.setValue(2.0);
  orthocam->position = SbVec3f(0.0f, 0.0f, 1.0f);

  root->addChild(orthocam);
  root->addChild(color);
  root->addChild(text);

  return root;
}

int
main(int argc, char ** argv)
{
  QApplication app(argc, argv);
  // Initializes Quarter (and implicitly also Coin and Qt
  Quarter::init();

  // Make a dead simple scene graph by using the Coin library, only
  // containing a single yellow cone under the scenegraph root.
  SoSeparator * root = new SoSeparator;
  root->ref();

  SoBaseColor * col = new SoBaseColor;
  col->rgb = SbColor(1, 1, 0);
  root->addChild(col);

  root->addChild(new SoCone);

  // Create a QuarterWidget for displaying a Coin scene graph
  QuarterWidget * viewer = new QuarterWidget;
  viewer->setSceneGraph(root);

  // Add some background text
  SoSeparator * background = create_background();
  background->ref();
  (void)viewer->getSoRenderManager()->addSuperimposition(background,
                                                         SoRenderManager::Superimposition::BACKGROUND);
  

  // Add some super imposed text
  SoSeparator * superimposed = create_superimposition();
  superimposed->ref();
  (void)viewer->getSoRenderManager()->addSuperimposition(superimposed);

  // Pop up the QuarterWidget
  viewer->show();
  // Loop until exit.
  app.exec();
  // Clean up resources.
  root->unref();
  superimposed->unref();
  background->unref();
  delete viewer;
  Quarter::clean();

  return 0;
}
