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

/*! \mainpage 

  Quarter is a light-weight glue library that provides seamless
  integration between Systems in Motions's \COIN high-level 3D
  visualization library and Trolltech's \QT 2D user interface
  library. 

  \QT and \COIN is a perfect match since they are both open source,
  widely portable and easy to use. Quarter has evolved from Systems in
  Motion's own experiences using \COIN and \QT together in our
  applications.

  The functionality in Quarter revolves around QuarterWidget, a
  subclass of QGLWidget. This widget provides functionality for
  rendering of Coin scenegraphs and translation of QEvents into
  SoEvents. Using this widget is as easy as using any other QWidget.

  Quarter also comes with a plugin for Qt Designer, Trolltech's tool
  for designing and building GUIs. Once you install Quarter, the
  QuarterWidget becomes accessible in Qt Designer, and you can include
  it in the user interfaces you create. The plugin facility also
  provides you with the capability of dynamically loading ui files
  containing a QuarterWidget in your application.

  By using \COIN, \QT and Quarter to build your 3D graphics
  applications, you have the power to write software that is portable
  across the whole range of UNIX, Linux, Microsoft Windows and Mac OS
  X operating systems, from a 100% common codebase.

  For a small, completely stand-alone usage example on how to
  initialize the library and set up a viewer instance window, see the
  following code:

  \code
  #include <Inventor/nodes/SoBaseColor.h>
  #include <Inventor/nodes/SoCone.h>
  #include <Inventor/nodes/SoSeparator.h>
  
  #include <Quarter/QuarterWidget.h>
  #include <Quarter/QuarterApplication.h>
  
  using namespace SIM::Coin3D::Quarter;
  
  int
  main(int argc, char ** argv)
  {
    // Initializes SoQt library (and implicitly also the Coin and Qt
    // libraries).
    QuarterApplication app(argc, argv);
    
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

    // Pop up the QuarterWidget
    viewer->show();
    // Loop until exit.
    app.exec();
    // Clean up resources.
    root->unref();
    delete viewer;

    return 0;
  }
  \endcode

  This example code can be found in the Quarter/src/examples directory.

  \defgroup plugins Plugins
*/


#include <Inventor/SoDB.h>
#include <Inventor/nodekits/SoNodeKit.h>
#include <NutsnBolts/NutsnBolts.h>

#include <Quarter/Quarter.h>
#include "SensorManager.h"
#include "devices/KeyboardHandlerP.h"

using namespace SIM::Coin3D::Quarter;

static Quarter * self = NULL;

Quarter::Quarter(void)
{
  this->sensormanager = new SensorManager;
}

Quarter::~Quarter()
{
  delete this->sensormanager;

  if (KeyboardHandlerP::keyboardmap != NULL) {
    KeyboardHandlerP::keyboardmap->clear();
    KeyboardHandlerP::keypadmap->clear();
    delete KeyboardHandlerP::keyboardmap;
    delete KeyboardHandlerP::keypadmap;
  }
}

/*!
  initialize Quarter, and implicitly Coin
 */
void
Quarter::init(void)
{
  if (self) {
    fprintf(stderr, "Quarter is already initialized\n");
    return;
  }
  
  SoDB::init();
  SoNodeKit::init();
  NutsnBolts::init();
  
  self = new Quarter;
}

/*!
  clean up resources
 */
void
Quarter::clean(void)
{
  NutsnBolts::clean();
  assert(self);
  delete self;
}

#undef PRIVATE
