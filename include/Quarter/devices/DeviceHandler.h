#ifndef QUARTER_DEVICEHANDLER_H
#define QUARTER_DEVICEHANDLER_H

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

#include <Quarter/Basic.h>
#include <Inventor/SbVec2s.h>

class QEvent;
class SoEvent;
class QInputEvent;

namespace SIM { namespace Coin3D { namespace Quarter {

class DeviceManager;

class QUARTER_DLL_API DeviceHandler {
public:
  DeviceHandler(void) {}
  virtual ~DeviceHandler() {}

  /*! Subclasses must override this method to provide custom event
    handling
   */
  virtual const SoEvent * translateEvent(QEvent * event) = 0;

protected:
  void setManager(DeviceManager * manager);
  void setModifiers(SoEvent * soevent, QInputEvent * qevent);

  friend class DeviceManager;
  DeviceManager * manager;
};

}}} // namespace

#endif // QUARTER_DEVICEHANDLER_H
