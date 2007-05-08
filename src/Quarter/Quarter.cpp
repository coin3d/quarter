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
  \mainpage
  Quarter is a Gui binding for Coin and Qt-4

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
  initialize Quarter
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
