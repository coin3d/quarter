
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

#include "ContextMenu.h"

#include <QtGui/QMenu>
#include <QtCore/QMap>
#include <QtGui/QMouseEvent>

#include <Inventor/SoEventManager.h>
#include <Inventor/scxml/SoScXMLStateMachine.h>

#include <Quarter/QuarterWidget.h>
#include <Quarter/eventhandlers/EventManager.h>
#include <Quarter/eventhandlers/ContextMenuHandler.h>

using namespace SIM::Coin3D::Quarter;

#define PUBLIC(obj) obj->publ

ContextMenu::ContextMenu(QuarterWidget * quarterwidget)
{
  this->publ = publ;
  
  this->quarterwidget = quarterwidget;
  this->rendermanager = quarterwidget->getSoRenderManager();

  this->contextmenu = new QMenu;
  this->functionsmenu = new QMenu("Functions");
  this->rendermenu = new QMenu("Render Mode");
  this->stereomenu = new QMenu("Stereo Mode");
  this->transparencymenu = new QMenu("Transparency Type");

  this->functionsgroup = new QActionGroup(this);
  this->stereomodegroup = new QActionGroup(this);
  this->rendermodegroup = new QActionGroup(this);
  this->transparencytypegroup = new QActionGroup(this);

  this->rendermodes.append(new RenderModePair(SoRenderManager::AS_IS, "as is"));
  this->rendermodes.append(new RenderModePair(SoRenderManager::WIREFRAME, "wireframe"));
  this->rendermodes.append(new RenderModePair(SoRenderManager::WIREFRAME_OVERLAY, "wireframe overlay"));
  this->rendermodes.append(new RenderModePair(SoRenderManager::POINTS, "points"));
  this->rendermodes.append(new RenderModePair(SoRenderManager::HIDDEN_LINE, "hidden line"));
  this->rendermodes.append(new RenderModePair(SoRenderManager::BOUNDING_BOX, "bounding box"));
    
  this->stereomodes.append(new StereoModePair(SoRenderManager::MONO, "mono"));
  this->stereomodes.append(new StereoModePair(SoRenderManager::ANAGLYPH, "anaglyph"));
  this->stereomodes.append(new StereoModePair(SoRenderManager::QUAD_BUFFER, "quad buffer"));
  this->stereomodes.append(new StereoModePair(SoRenderManager::INTERLEAVED_ROWS, "interleaved rows"));
  this->stereomodes.append(new StereoModePair(SoRenderManager::INTERLEAVED_COLUMNS, "interleaved columns"));
    
  this->transparencytypes.append(new TransparencyTypePair(SoGLRenderAction::NONE, "none"));
  this->transparencytypes.append(new TransparencyTypePair(SoGLRenderAction::SCREEN_DOOR, "screen door"));
  this->transparencytypes.append(new TransparencyTypePair(SoGLRenderAction::ADD, "add"));
  this->transparencytypes.append(new TransparencyTypePair(SoGLRenderAction::DELAYED_ADD, "delayed add"));
  this->transparencytypes.append(new TransparencyTypePair(SoGLRenderAction::SORTED_OBJECT_ADD, "sorted object add"));
  this->transparencytypes.append(new TransparencyTypePair(SoGLRenderAction::BLEND, "blend"));
  this->transparencytypes.append(new TransparencyTypePair(SoGLRenderAction::DELAYED_BLEND, "delayed blend"));
  this->transparencytypes.append(new TransparencyTypePair(SoGLRenderAction::SORTED_OBJECT_BLEND, "sorted object blend"));
  this->transparencytypes.append(new TransparencyTypePair(SoGLRenderAction::SORTED_OBJECT_SORTED_TRIANGLE_ADD, "sorted object sorted triangle add"));
  this->transparencytypes.append(new TransparencyTypePair(SoGLRenderAction::SORTED_OBJECT_SORTED_TRIANGLE_BLEND, "sorted object sorted triangle blend"));
  this->transparencytypes.append(new TransparencyTypePair(SoGLRenderAction::SORTED_LAYERS_BLEND, "sorted layers blend"));

  foreach(RenderModePair * rendermode, this->rendermodes) {
    QAction * action = new QAction(rendermode->second, this);
    action->setCheckable(true);
    action->setChecked(rendermanager->getRenderMode() == rendermode->first);
    action->setData(rendermode->first);
    this->rendermodeactions.append(action);
    this->rendermodegroup->addAction(action);
    this->rendermenu->addAction(action);
  }
    
  foreach(StereoModePair * stereomode, this->stereomodes) {
    QAction * action = new QAction(stereomode->second, this);
    action->setCheckable(true);
    action->setChecked(rendermanager->getStereoMode() == stereomode->first);
    action->setData(stereomode->first);
    this->stereomodeactions.append(action);
    this->stereomodegroup->addAction(action);
    this->stereomenu->addAction(action);
  }
    
  foreach(TransparencyTypePair * transparencytype, this->transparencytypes) {
    QAction * action = new QAction(transparencytype->second, this);
    action->setCheckable(true);
    action->setChecked(rendermanager->getGLRenderAction()->getTransparencyType() == transparencytype->first);
    action->setData(transparencytype->first);
    this->transparencytypeactions.append(action);
    this->transparencytypegroup->addAction(action);
    this->transparencymenu->addAction(action);
  }

  QAction * viewall = new QAction("View All", this);
  QAction * seek = new QAction("Seek", this);
  this->functionsmenu->addAction(viewall);
  this->functionsmenu->addAction(seek);
    
  this->connect(seek, SIGNAL(triggered(bool)),
                this, SLOT(seek(bool)));

  this->connect(viewall, SIGNAL(triggered(bool)),
                this, SLOT(viewAll(bool)));

  this->connect(this->rendermodegroup, SIGNAL(triggered(QAction *)),
                this, SLOT(changeRenderMode(QAction *)));
    
  this->connect(this->stereomodegroup, SIGNAL(triggered(QAction *)),
                this, SLOT(changeStereoMode(QAction *)));
    
  this->connect(this->transparencytypegroup, SIGNAL(triggered(QAction *)),
                this, SLOT(changeTransparencyType(QAction *)));
    
  this->contextmenu->addMenu(this->functionsmenu);
  this->contextmenu->addMenu(this->rendermenu);
  this->contextmenu->addMenu(this->stereomenu);
  this->contextmenu->addMenu(this->transparencymenu);
}
      
ContextMenu::~ContextMenu()
{
  foreach(RenderModePair * rendermode, this->rendermodes) delete rendermode;
  foreach(StereoModePair * stereomode, this->stereomodes) delete stereomode;
  foreach(TransparencyTypePair * transparencytype, this->transparencytypes) delete transparencytype;
  
  delete this->functionsmenu;
  delete this->rendermenu;
  delete this->stereomenu;
  delete this->transparencymenu;
  delete this->contextmenu;
}
      
QMenu * 
ContextMenu::getMenu(void) const
{ 
  return this->contextmenu;
}
      
bool
ContextMenu::contextMenuEvent(QMouseEvent * event)
{
  SoEventManager * eventmanager = this->quarterwidget->getSoEventManager();
  const SbName popupevent("sim.coin3d.coin.PopupMenuOpen");
  for (int c = 0; c < eventmanager->getNumSoScXMLStateMachines(); ++c) {
    SoScXMLStateMachine * sostatemachine =
      eventmanager->getSoScXMLStateMachine(c);
    sostatemachine->queueEvent(popupevent);
    sostatemachine->processEventQueue();
  }

  (void) this->contextmenu->exec(event->globalPos());
  return true;
}

void
ContextMenu::seek(bool checked)
{
  SoEventManager * eventmanager = this->quarterwidget->getSoEventManager();
  const SbName seekevent("sim.coin3d.coin.navigation.Seek");
  for (int c = 0; c < eventmanager->getNumSoScXMLStateMachines(); ++c) {
    SoScXMLStateMachine * sostatemachine =
      eventmanager->getSoScXMLStateMachine(c);
    sostatemachine->queueEvent(seekevent);
    sostatemachine->processEventQueue();
  }
}

void
ContextMenu::viewAll(bool checked)
{
  SoEventManager * eventmanager = this->quarterwidget->getSoEventManager();
  const SbName viewallevent("sim.coin3d.coin.navigation.ViewAll");
  for (int c = 0; c < eventmanager->getNumSoScXMLStateMachines(); ++c) {
    SoScXMLStateMachine * sostatemachine =
      eventmanager->getSoScXMLStateMachine(c);
    sostatemachine->queueEvent(viewallevent);
    sostatemachine->processEventQueue();
  }
}

void
ContextMenu::changeRenderMode(QAction * action)
{
  QVariant rendermode = action->data();
  this->rendermanager->setRenderMode((SoRenderManager::RenderMode)rendermode.toInt());
}

void
ContextMenu::changeStereoMode(QAction * action)
{
  QVariant stereomode = action->data();
  this->rendermanager->setStereoMode((SoRenderManager::StereoMode)stereomode.toInt());
}

void
ContextMenu::changeTransparencyType(QAction * action)
{
  QVariant transparencytype = action->data();
  this->quarterwidget->setTransparencyType((SoGLRenderAction::TransparencyType)transparencytype.toInt());
}

#undef PUBLIC
