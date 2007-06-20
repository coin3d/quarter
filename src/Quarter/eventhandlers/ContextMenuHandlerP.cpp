
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

#include "ContextMenuHandlerP.h"

#include <QMenu>
#include <QMap>
#include <QActionGroup>
#include <QMouseEvent>

#include <Quarter/QuarterWidget.h>
#include <Quarter/eventhandlers/EventManager.h>
#include <Quarter/eventhandlers/ContextMenuHandler.h> 

using namespace SIM::Coin3D::Quarter;

#define PUBLIC(obj) obj->publ

ContextMenuHandlerP::ContextMenuHandlerP(ContextMenuHandler * publ)
{
  this->publ = publ;
}

ContextMenuHandlerP::~ContextMenuHandlerP()
{
  
}

bool
ContextMenuHandlerP::contextMenuEvent(QMouseEvent * event)
{
  QList<RenderModePair *> rendermodes;
  QList<StereoModePair *> stereomodes;
  
  rendermodes.append(new RenderModePair(SoSceneManager::AS_IS, "as is"));
  rendermodes.append(new RenderModePair(SoSceneManager::WIREFRAME, "wireframe"));
  rendermodes.append(new RenderModePair(SoSceneManager::WIREFRAME_OVERLAY, "wireframe overlay"));
  rendermodes.append(new RenderModePair(SoSceneManager::POINTS, "points"));
  rendermodes.append(new RenderModePair(SoSceneManager::HIDDEN_LINE, "hidden line"));
  rendermodes.append(new RenderModePair(SoSceneManager::BOUNDING_BOX, "bounding box"));

  stereomodes.append(new StereoModePair(SoSceneManager::MONO, "mono"));
  stereomodes.append(new StereoModePair(SoSceneManager::ANAGLYPH, "anaglyph"));
  stereomodes.append(new StereoModePair(SoSceneManager::QUAD_BUFFER, "quad buffer"));
  stereomodes.append(new StereoModePair(SoSceneManager::INTERLEAVED_ROWS, "interleaved rows"));
  stereomodes.append(new StereoModePair(SoSceneManager::INTERLEAVED_COLUMNS, "interleaved columns"));

  QMenu * contextmenu = new QMenu;
  QMenu * rendermenu = new QMenu("Render Mode");
  QMenu * stereomenu = new QMenu("Stereo Mode");

  QList<QAction *> rendermodeactions;
  QList<QAction *> stereomodeactions;
  QActionGroup * stereomodegroup = new QActionGroup(this);
  QActionGroup * rendermodegroup = new QActionGroup(this);

  const QuarterWidget * quarterwidget = PUBLIC(this)->manager->getWidget();
  SoSceneManager * scenemanager = quarterwidget->getSceneManager();

  foreach(RenderModePair * rendermode, rendermodes) {
    QAction * action = new QAction(rendermode->second, this);
    action->setCheckable(true);
    action->setChecked(scenemanager->getRenderMode() == rendermode->first);
    action->setData(rendermode->first);
    rendermodeactions.append(action);
    rendermodegroup->addAction(action);
    rendermenu->addAction(action);
  }

  foreach(StereoModePair * stereomode, stereomodes) {
    QAction * action = new QAction(stereomode->second, this);
    action->setCheckable(true);
    action->setChecked(scenemanager->getStereoMode() == stereomode->first);
    action->setData(stereomode->first);
    stereomodeactions.append(action);
    stereomodegroup->addAction(action);
    stereomenu->addAction(action);
  }

  connect(rendermodegroup, SIGNAL(triggered(QAction *)), 
          this, SLOT(changeRenderMode(QAction *)));
  
  connect(stereomodegroup, SIGNAL(triggered(QAction *)), 
          this, SLOT(changeStereoMode(QAction *)));

  contextmenu->addMenu(rendermenu);
  contextmenu->addMenu(stereomenu);
  
  contextmenu->exec(event->globalPos());

  // clean up
  foreach(RenderModePair * rendermode, rendermodes) delete rendermode;
  foreach(StereoModePair * stereomode, stereomodes) delete stereomode;
  
  delete rendermenu;
  delete stereomenu;
  delete contextmenu;

  return true;
}

void
ContextMenuHandlerP::changeRenderMode(QAction * action)
{
  const QuarterWidget * quarterwidget = PUBLIC(this)->manager->getWidget();
  SoSceneManager * scenemanager = quarterwidget->getSceneManager();

  QVariant rendermode = action->data();
  scenemanager->setRenderMode((SoSceneManager::RenderMode)rendermode.toInt());
}

void
ContextMenuHandlerP::changeStereoMode(QAction * action)
{
  const QuarterWidget * quarterwidget = PUBLIC(this)->manager->getWidget();
  SoSceneManager * scenemanager = quarterwidget->getSceneManager();
  
  QVariant stereomode = action->data();
  scenemanager->setStereoMode((SoSceneManager::StereoMode)stereomode.toInt());
}

#undef PUBLIC
