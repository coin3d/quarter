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

#ifndef QUARTER_CONTEXTMENUHANDLERP_H
#define QUARTER_CONTEXTMENUHANDLERP_H

#include <QtCore/QPair>
#include <QtCore/QObject>
#include <QtGui/QActionGroup>
#include <Inventor/SoRenderManager.h>
#include <Inventor/actions/SoGLRenderAction.h>

class QMenu;
class QAction;
class QMouseEvent;

namespace SIM { namespace Coin3D { namespace Quarter {

class QuarterWidget;
class ContextMenuHandler;

class ContextMenu : public QObject {
  Q_OBJECT
public:
  ContextMenu(QuarterWidget * quarterwidget);
  ~ContextMenu();

  bool contextMenuEvent(QMouseEvent * event);
  QMenu * getMenu(void) const;

public slots:
  void seek(bool);
  void viewAll(bool);
  void changeRenderMode(QAction * action);
  void changeStereoMode(QAction * action);
  void changeTransparencyType(QAction * action);

private:
  typedef QPair<SoRenderManager::RenderMode, QString> RenderModePair;
  typedef QPair<SoRenderManager::StereoMode, QString> StereoModePair;
  typedef QPair<SoGLRenderAction::TransparencyType, QString> TransparencyTypePair;

  ContextMenuHandler * publ;

  SoRenderManager * rendermanager;
  QuarterWidget * quarterwidget;

  QList<RenderModePair *> rendermodes;
  QList<StereoModePair *> stereomodes;
  QList<TransparencyTypePair *> transparencytypes;
    
  QList<QAction *> rendermodeactions;
  QList<QAction *> stereomodeactions;
  QList<QAction *> transparencytypeactions;

  QActionGroup * functionsgroup;
  QActionGroup * stereomodegroup;
  QActionGroup * rendermodegroup;
  QActionGroup * transparencytypegroup;

  QMenu * contextmenu;
  QMenu * rendermenu;
  QMenu * stereomenu;
  QMenu * functionsmenu;
  QMenu * transparencymenu;

};

}}} // namespace

#endif // QUARTER_CONTEXTMENUHANDLERP_H
