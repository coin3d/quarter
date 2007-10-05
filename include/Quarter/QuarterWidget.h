#ifndef QUARTER_QUARTERWIDGET_H
#define QUARTER_QUARTERWIDGET_H

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

#include <QtOpenGL/QGLWidget>
#include <Inventor/SbBasic.h>
#include <Quarter/Basic.h>
#include <Quarter/DropManager.h>

class SoNode;
class SoEvent;
class SoCamera;
class SoEventManager;
class SoRenderManager;
class SoDirectionalLight;

namespace SIM { namespace Coin3D { namespace Quarter {

class DeviceManager;
class DropManager;
 
class QUARTER_DLL_API QuarterWidget : public QGLWidget {
  typedef QGLWidget inherited;
  Q_OBJECT

public:
  QuarterWidget(QWidget * parent = 0, const QGLWidget * sharewidget = 0);
  QuarterWidget(QGLContext * context, QWidget * parent = 0, const QGLWidget * sharewidget = 0);
  virtual ~QuarterWidget();

  void enableHeadlight(const SbBool onoff);
  SoDirectionalLight * getHeadlight(void);
  uint32_t getCacheContextId(void) const;
  
  virtual void setSceneGraph(SoNode * root);
  virtual SoNode * getSceneGraph(void) const;
  DeviceManager * getDeviceManager(void) const;
  SoEventManager * getSoEventManager(void) const;
  SoRenderManager * getSoRenderManager(void) const;

  void addDropManager(DropManager * dm);

public slots:
  virtual void viewAll(void);

signals:
  friend class DropManager;
  void drop();
 
protected:
  virtual void resizeGL(int width, int height);
  virtual void initializeGL(void);
  virtual void paintGL(void);
  virtual bool event(QEvent * event);
  virtual void actualRedraw(void);

  static void renderCB(void * closure, SoRenderManager *);

private:
  void constructor(const QGLWidget * sharewidget);
  friend class QuarterWidgetP;
  class QuarterWidgetP * pimpl;

};

}}} // namespace

#endif // QUARTER_QUARTERWIDGET_H
