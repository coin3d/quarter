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

#include <QUiLoader>
#include <QFile>

#include <Inventor/nodes/SoOrthographicCamera.h>
#include <Inventor/nodes/SoSeparator.h>
#include <Inventor/nodes/SoText2.h>
#include <Inventor/nodes/SoCone.h>
#include <Inventor/nodes/SoBaseColor.h>
#include <Inventor/nodes/SoTranslation.h>

#include <NutsnBolts/NbSceneManager.h>

#include <Quarter/QuarterWidget.h>
#include <Quarter/QuarterApplication.h>
#include <Quarter/devices/DragDropHandler.h>
#include <Quarter/devices/DeviceManager.h>

using namespace SIM::Coin3D::Quarter;

int main(int argc, char *argv[])
{
  QuarterApplication app(argc, argv);

  QFile file(":/viewer.ui");
  if (!file.open(QFile::ReadOnly)) {
    assert(0 && "could not open ui file");
  }
  QUiLoader loader;
  QWidget * widget = loader.load(&file);
  assert(widget);
  file.close();

  QuarterWidget * viewer = qFindChild<QuarterWidget *>(widget, "QuarterWidget");
  assert(viewer);
  viewer->getDeviceManager()->registerDevice(new DragDropHandler);

  SoCone * scene = new SoCone;
  scene->ref();

  viewer->setSceneGraph(scene);

  SoSeparator * overlayroot = new SoSeparator;
  overlayroot->ref();
  SoTranslation * translation = new SoTranslation;
  translation->translation.setValue(SbVec3f(0.1,0.1,0.1));
  SoBaseColor * color = new SoBaseColor;
  color->rgb.setValue(SbColor(1.0, 0.0, 0.0));
  SoText2 * text = new SoText2;
  text->string.setValue("Super Imposed Scene");
  SoOrthographicCamera * orthocam = new SoOrthographicCamera;
  orthocam->height.setValue(1.0);
  orthocam->nearDistance.setValue(0.0);
  orthocam->farDistance.setValue(1.0);

  overlayroot->addChild(orthocam);
  overlayroot->addChild(color);
  overlayroot->addChild(translation);
  overlayroot->addChild(text);

  (void)viewer->getSceneManager()->addSuperimposition(overlayroot);

  widget->show();
  int retval = app.exec();

  overlayroot->unref();
  scene->unref();

  return retval;
}
