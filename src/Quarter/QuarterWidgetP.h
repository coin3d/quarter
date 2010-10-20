#ifndef QUARTER_QUARTERWIDGETP_H
#define QUARTER_QUARTERWIDGETP_H

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

#include <Inventor/SbBasic.h>
#include <Inventor/SbName.h>
#include <QtGui/QCursor>
#include <QtCore/QList>
#include <QtCore/QUrl>

class SoNode;
class SoCamera;
class SoRenderManager;
class SoEventManager;
class SoDirectionalLight;
class QuarterWidgetP_cachecontext;
class QGLWidget;
class QAction;
class QActionGroup;
class QMenu;
class ScXMLStateMachine;
class SoScXMLStateMachine;
template <class Key, class T> class QMap;

namespace SIM { namespace Coin3D { namespace Quarter {

class EventFilter;
class InteractionMode;
class ContextMenu;

class QuarterWidgetP {
public:

  QuarterWidgetP(class QuarterWidget * master, const QGLWidget * sharewidget);
  ~QuarterWidgetP();

  SoCamera * searchForCamera(SoNode * root);
  uint32_t getCacheContextId(void) const;
  QMenu * contextMenu(void);

  QList<QAction *> transparencyTypeActions(void) const;
  QList<QAction *> renderModeActions(void) const;
  QList<QAction *> stereoModeActions(void) const;

  QuarterWidget * const master;
  SoNode * scene;
  EventFilter * eventfilter;
  InteractionMode * interactionmode;
  SoRenderManager * sorendermanager;
  SoEventManager * soeventmanager;
  bool initialsorendermanager;
  bool initialsoeventmanager;
  SoDirectionalLight * headlight;
  QuarterWidgetP_cachecontext * cachecontext;
  bool contextmenuenabled;
  bool autoredrawenabled;
  bool interactionmodeenabled;
  bool clearzbuffer;
  bool clearwindow;
  bool addactions;
  bool processdelayqueue;
  QUrl navigationModeFile;
  SoScXMLStateMachine * currentStateMachine;

  static void rendercb(void * userdata, SoRenderManager *);
  static void prerendercb(void * userdata, SoRenderManager * manager);
  static void postrendercb(void * userdata, SoRenderManager * manager);
  static void statechangecb(void * userdata, ScXMLStateMachine * statemachine, const char * stateid, SbBool enter, SbBool success);

  mutable QList<QAction *> transparencytypeactions;
  mutable QList<QAction *> rendermodeactions;
  mutable QList<QAction *> stereomodeactions;

  mutable QActionGroup * transparencytypegroup;
  mutable QActionGroup * stereomodegroup;
  mutable QActionGroup * rendermodegroup;

  mutable ContextMenu * contextmenu;

  static bool nativeEventFilter(void * message, long * result);

 private:
  QuarterWidgetP_cachecontext * findCacheContext(QuarterWidget * widget, const QGLWidget * sharewidget);
  static void removeFromCacheContext(QuarterWidgetP_cachecontext * context, const QGLWidget * widget);
};

#endif // QUARTER_QUARTERWIDGETP_H

}}} // namespace
