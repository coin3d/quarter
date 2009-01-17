
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

#include "ContextMenu.h"

#include <QtGui/QMenu>

#include <Inventor/SoEventManager.h>
#include <Inventor/scxml/SoScXMLStateMachine.h>

#include <Quarter/QuarterWidget.h>

using namespace SIM::Coin3D::Quarter;

ContextMenu::ContextMenu(QuarterWidget * quarterwidget)
  : quarterwidget(quarterwidget)
{
  this->contextmenu = new QMenu;
  this->functionsmenu = new QMenu("Functions");
  this->rendermenu = new QMenu("Render Mode");
  this->stereomenu = new QMenu("Stereo Mode");
  this->transparencymenu = new QMenu("Transparency Type");

  this->contextmenu->addMenu(functionsmenu);
  this->contextmenu->addMenu(rendermenu);
  this->contextmenu->addMenu(stereomenu);
  this->contextmenu->addMenu(transparencymenu);

  SoRenderManager * sorendermanager = quarterwidget->getSoRenderManager();

  QActionGroup * rendermodegroup = NULL;
  QActionGroup * stereomodegroup = NULL;
  QActionGroup * transparencytypegroup = NULL;
  
  foreach (QAction * action, quarterwidget->renderModeActions()) {
    if (!rendermodegroup) {
      rendermodegroup = action->actionGroup();
    } else {
      assert(rendermodegroup && rendermodegroup == action->actionGroup());
    }
    
    int rendermode = static_cast<QuarterWidget::RenderMode>(sorendermanager->getRenderMode());
    int data = static_cast<QuarterWidget::RenderMode>(action->data().toInt());
    action->setChecked(rendermode == data);
    rendermenu->addAction(action);
  }

  foreach (QAction * action, quarterwidget->stereoModeActions()) {
    if (!stereomodegroup) {
      stereomodegroup = action->actionGroup();
    } else {
      assert(stereomodegroup && stereomodegroup == action->actionGroup());
    }

    int stereomode = static_cast<QuarterWidget::StereoMode>(sorendermanager->getStereoMode());
    int data = static_cast<QuarterWidget::StereoMode>(action->data().toInt());
    action->setChecked(stereomode == data);
    stereomenu->addAction(action);
  }
  
  foreach (QAction * action, quarterwidget->transparencyTypeActions()) {
    if (!transparencytypegroup) {
      transparencytypegroup = action->actionGroup();
    } else {
      assert(transparencytypegroup && transparencytypegroup == action->actionGroup());
    }

    SoGLRenderAction * renderaction = sorendermanager->getGLRenderAction();
    int transparencytype = static_cast<SoGLRenderAction::TransparencyType>(renderaction->getTransparencyType());
    int data = static_cast<SoGLRenderAction::TransparencyType>(action->data().toInt());
    action->setChecked(transparencytype == data);
    transparencymenu->addAction(action);
  }
  
  QAction * viewall = new QAction("View All", quarterwidget);
  QAction * seek = new QAction("Seek", quarterwidget);
  functionsmenu->addAction(viewall);
  functionsmenu->addAction(seek);
  
  QObject::connect(seek, SIGNAL(triggered()),
                   this->quarterwidget, SLOT(seek()));
  
  QObject::connect(viewall, SIGNAL(triggered()),
                   this->quarterwidget, SLOT(viewAll()));
  
  // FIXME: It would be ideal to expose these actiongroups to Qt
  // Designer and be able to connect them to the appropriate slots on
  // QuarterWidget, but this is not possible in Qt. Exposing every
  // single action is supposed to work, but it doesn't at the
  // moment. (20081215 frodo)
  QObject::connect(rendermodegroup, SIGNAL(triggered(QAction *)),
                   this, SLOT(changeRenderMode(QAction *)));
  
  QObject::connect(stereomodegroup, SIGNAL(triggered(QAction *)),
                   this, SLOT(changeStereoMode(QAction *)));
  
  QObject::connect(transparencytypegroup, SIGNAL(triggered(QAction *)),
                   this, SLOT(changeTransparencyType(QAction *)));
}
      
ContextMenu::~ContextMenu()
{
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

void
ContextMenu::changeRenderMode(QAction * action)
{
  QuarterWidget::RenderMode mode = 
    static_cast<QuarterWidget::RenderMode>(action->data().toInt());

  this->quarterwidget->setRenderMode(mode);
  this->quarterwidget->getSoRenderManager()->scheduleRedraw();
}

void
ContextMenu::changeStereoMode(QAction * action)
{
  QuarterWidget::StereoMode mode = 
    static_cast<QuarterWidget::StereoMode>(action->data().toInt());

  this->quarterwidget->setStereoMode(mode);
  this->quarterwidget->getSoRenderManager()->scheduleRedraw();
}

void
ContextMenu::changeTransparencyType(QAction * action)
{
  QuarterWidget::TransparencyType type = 
    static_cast<QuarterWidget::TransparencyType>(action->data().toInt());
  
  this->quarterwidget->setTransparencyType(type);
  this->quarterwidget->getSoRenderManager()->scheduleRedraw();
}
