/**************************************************************************\
 *
 *  This file is part of the SIM Quarter extension library for Coin.
 *  Copyright (C) 1998-2005 by Systems in Motion.  All rights reserved.
 *
 *  This library is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License ("GPL") version 2
 *  as published by the Free Software Foundation.  See the file COPYING
 *  at the root directory of this source distribution for additional
 *  information about the GNU GPL.
 *
 *  For using SIM Nuts'n'Bolts with software that can not be combined with
 *  the GNU GPL, and for taking advantage of the additional benefits of
 *  our support services, please contact Systems in Motion about acquiring
 *  a Coin Professional Edition License.
 *
 *  See <URL:http://www.coin3d.org/> for more information.
 *
 *  Systems in Motion AS, Bygdøy allé 5, N-0257 Oslo, NORWAY. (www.sim.no)
 *
\**************************************************************************/

#include <QList>
#include <QUrl>
#include <QFileInfo>
#include <QStringList>

#include <Quarter/CoinWidget.h>
#include <Quarter/CoinApplication.h>

#include <Inventor/SoSceneManager.h>
#include <Inventor/SbViewportRegion.h>
#include <Inventor/SbTime.h>
#include <Inventor/system/gl.h>
#include <Inventor/errors/SoDebugError.h>
#include <Inventor/events/SoEvents.h>
#include <Inventor/nodes/SoNode.h>
#include <Inventor/nodes/SoCamera.h>
#include <Inventor/nodes/SoSeparator.h>
#include <Inventor/actions/SoSearchAction.h>

#include <NutsnBolts/NbSceneManager.h>
#include <NutsnBolts/navigation/NbNavigationSystem.h>

#include <QMouseEvent>
#include <assert.h>

class CoinWidgetP {
public:
  CoinWidgetP(void) {
    this->scenemanager = new NbSceneManager;
    this->location2 = new SoLocation2Event;
    this->keyboard = new SoKeyboardEvent;
    this->mousebutton = new SoMouseButtonEvent;
    this->root = NULL;
    this->navigationsystem = NULL;
    this->suffixes << "iv" << "wrl";
  }

  ~CoinWidgetP() {
    delete this->scenemanager;
    delete this->location2;
    delete this->keyboard;
    delete this->mousebutton;
    if (this->root) {
      this->root->unref();
    }
  }

  NbSceneManager * scenemanager;
  NbNavigationSystem * navigationsystem;
  SoLocation2Event * location2;
  SoMouseButtonEvent * mousebutton;
  SoKeyboardEvent * keyboard;
  SoSeparator * root;
  QStringList suffixes;
};

#define PRIVATE(obj) obj->pimpl


CoinWidget::CoinWidget(QWidget * parent)
  : inherited(parent) 
{
  this->constructor();
}

CoinWidget::CoinWidget(QGLContext * context, QWidget * parent)
  : inherited(context, parent)
{
  this->constructor();
}

void
CoinWidget::constructor(void)
{
  PRIVATE(this) = new CoinWidgetP;
  PRIVATE(this)->navigationsystem = NbNavigationSystem::createByName(NB_EXAMINER_SYSTEM);
  PRIVATE(this)->scenemanager->setNavigationSystem(PRIVATE(this)->navigationsystem);
  PRIVATE(this)->scenemanager->setNavigationState(NbSceneManager::MIXED_NAVIGATION);
  PRIVATE(this)->scenemanager->setRenderCallback(CoinWidget::renderCB, this);
  PRIVATE(this)->scenemanager->activate();
  
  this->setMouseTracking(TRUE);
}

CoinWidget::~CoinWidget()
{
  delete PRIVATE(this);
}

static const char * superscene[] = {
  "#Inventor V2.1 ascii\n",
  "\n",
  "DEF root Separator {\n",
  "  DEF light DirectionalLight {\n",
  "    direction 0 0 -1\n",
  "    intensity 1.0\n",
  "  }\n",
  "  DEF camera PerspectiveCamera {\n",
  "  }\n",
  "}\n",
  NULL
};

SbBool 
CoinWidget::setSceneGraph(SoNode * node)
{
  if (node == NULL) {
    if (PRIVATE(this)->root) {
      PRIVATE(this)->root->unref();
      PRIVATE(this)->root = NULL;
      PRIVATE(this)->scenemanager->setSceneGraph(NULL);
    }
    return TRUE;
  } else {
    this->setSceneGraph(NULL);
  }

  SoInput in;
  in.setStringArray(superscene);
  SoNode * scene = NULL;
  if (!SoDB::read(&in, scene)) {
    assert(0);
    return FALSE;
  }
  scene->ref(); // actions are applied later
  
  SoSearchAction sa;
  
  // get desired root node
  sa.setInterest(SoSearchAction::FIRST);
  sa.setName(SbName("root"));
  sa.apply(scene);
  if (!sa.getPath()) {
    assert(0 && "no root");
    return FALSE;
  }
  
  SoNode * root = sa.getPath()->getTail();
  if (!root->isOfType(SoSeparator::getClassTypeId())) {
    assert(0 && "invalid root type");
    return FALSE;
  }
  
  PRIVATE(this)->root = (SoSeparator *) root;
  PRIVATE(this)->root->ref();
  root = NULL;
  
  sa.reset();
  sa.setInterest(SoSearchAction::FIRST);
  sa.setType(SoCamera::getClassTypeId());
  sa.apply(PRIVATE(this)->root);
  if (!sa.getPath()) {
    assert(0 && "no camera");
    return FALSE;
  }

  assert(sa.getPath()->getTail()->isOfType(SoCamera::getClassTypeId()));
  SoCamera * camera = (SoCamera *) sa.getPath()->getTail();
  PRIVATE(this)->navigationsystem->setCamera(camera);
  
  PRIVATE(this)->root->addChild(node);
  
  camera->viewAll(PRIVATE(this)->root, 
                  PRIVATE(this)->scenemanager->getViewportRegion());
  
  PRIVATE(this)->scenemanager->setSceneGraph(PRIVATE(this)->root);

  return TRUE;
}

void
CoinWidget::initializeGL(void)
{
  inherited::initializeGL();
  glEnable(GL_DEPTH_TEST);
}

void
CoinWidget::resizeGL(int width, int height)
{
  inherited::resizeGL(width, height);
  PRIVATE(this)->scenemanager->setViewportRegion(SbViewportRegion(width, height));
}

void
CoinWidget::paintGL(void)
{
  inherited::paintGL();
  PRIVATE(this)->scenemanager->render(TRUE, TRUE);
}

void 
CoinWidget::renderCB(void * closure, SoSceneManager * manager)
{
  assert(closure);
  CoinWidget * thisp = (CoinWidget *) closure;
  assert(manager == PRIVATE(thisp)->scenemanager);
  
  thisp->makeCurrent();
  PRIVATE(thisp)->scenemanager->render(TRUE, TRUE);
  if (thisp->doubleBuffer()) {
    thisp->swapBuffers();
  }
}

void
CoinWidget::mousePressEvent(QMouseEvent * event)
{
  PRIVATE(this)->mousebutton->setTime(SbTime());
  PRIVATE(this)->mousebutton->setPosition(PRIVATE(this)->location2->getPosition());
  PRIVATE(this)->mousebutton->setShiftDown(PRIVATE(this)->keyboard->wasShiftDown());
  PRIVATE(this)->mousebutton->setCtrlDown(PRIVATE(this)->keyboard->wasCtrlDown());
  PRIVATE(this)->mousebutton->setAltDown(PRIVATE(this)->keyboard->wasAltDown());
  
  PRIVATE(this)->mousebutton->setState(SoButtonEvent::DOWN);
  PRIVATE(this)->mousebutton->setButton(SoMouseButtonEvent::ANY);
  switch (event->button()) {
  case Qt::LeftButton:
    PRIVATE(this)->mousebutton->setButton(SoMouseButtonEvent::BUTTON1);
    break;
  case Qt::RightButton:
    PRIVATE(this)->mousebutton->setButton(SoMouseButtonEvent::BUTTON2);
    break;
  case Qt::MidButton:
    PRIVATE(this)->mousebutton->setButton(SoMouseButtonEvent::BUTTON3);
    break;
  default:
    SoDebugError::postInfo("CoinWidget::mousePressEvent",
                           "Unhandled ButtonState = %x", event->button());
    break;
  }
  PRIVATE(this)->scenemanager->processEvent(PRIVATE(this)->mousebutton);
}

void
CoinWidget::mouseReleaseEvent(QMouseEvent * event)
{
  PRIVATE(this)->mousebutton->setTime(SbTime());
  PRIVATE(this)->mousebutton->setPosition(PRIVATE(this)->location2->getPosition());
  PRIVATE(this)->mousebutton->setShiftDown(PRIVATE(this)->keyboard->wasShiftDown());
  PRIVATE(this)->mousebutton->setCtrlDown(PRIVATE(this)->keyboard->wasCtrlDown());
  PRIVATE(this)->mousebutton->setAltDown(PRIVATE(this)->keyboard->wasAltDown());
  
  PRIVATE(this)->mousebutton->setState(SoButtonEvent::UP);
  PRIVATE(this)->mousebutton->setButton(SoMouseButtonEvent::ANY);
  switch (event->button()) {
  case Qt::LeftButton:
    PRIVATE(this)->mousebutton->setButton(SoMouseButtonEvent::BUTTON1); break;
  case Qt::RightButton:
    PRIVATE(this)->mousebutton->setButton(SoMouseButtonEvent::BUTTON2); break;
  case Qt::MidButton:
    PRIVATE(this)->mousebutton->setButton(SoMouseButtonEvent::BUTTON3); break;
  default:
    SoDebugError::postInfo("CoinWidget::mouseReleaseEvent",
                           "Unhandled ButtonState = %x", event->button());
    break;
  }
  PRIVATE(this)->scenemanager->processEvent(PRIVATE(this)->mousebutton);
}

void
CoinWidget::mouseMoveEvent(QMouseEvent * event)
{
  PRIVATE(this)->location2->setTime(SbTime());
  PRIVATE(this)->location2->setShiftDown(PRIVATE(this)->keyboard->wasShiftDown());
  PRIVATE(this)->location2->setCtrlDown(PRIVATE(this)->keyboard->wasCtrlDown());
  PRIVATE(this)->location2->setAltDown(PRIVATE(this)->keyboard->wasAltDown());
  
  SbVec2s pos(event->pos().x(), event->pos().y());
  pos[1] = PRIVATE(this)->scenemanager->getViewportRegion().getWindowSize()[1]
    - pos[1] - 1;
  PRIVATE(this)->location2->setPosition(pos);
  PRIVATE(this)->scenemanager->processEvent(PRIVATE(this)->location2);
}

static void setKey(SoKeyboardEvent * coinevent, QKeyEvent * qtevent)
{
  // FIXME: complete the key translation table
  switch (qtevent->key()) {
  case Qt::Key_Escape: coinevent->setKey(SoKeyboardEvent::ESCAPE); break;
  case Qt::Key_Space: coinevent->setKey(SoKeyboardEvent::SPACE); break;
  case Qt::Key_Tab: coinevent->setKey(SoKeyboardEvent::TAB); break;
  case Qt::Key_Backspace: coinevent->setKey(SoKeyboardEvent::BACKSPACE); break;
  case Qt::Key_Delete: coinevent->setKey(SoKeyboardEvent::KEY_DELETE); break;

  case Qt::Key_A: coinevent->setKey(SoKeyboardEvent::A); break;
  case Qt::Key_B: coinevent->setKey(SoKeyboardEvent::B); break;
  case Qt::Key_C: coinevent->setKey(SoKeyboardEvent::C); break;
  case Qt::Key_D: coinevent->setKey(SoKeyboardEvent::D); break;
  case Qt::Key_E: coinevent->setKey(SoKeyboardEvent::E); break;
  case Qt::Key_F: coinevent->setKey(SoKeyboardEvent::F); break;
  case Qt::Key_G: coinevent->setKey(SoKeyboardEvent::G); break;
  case Qt::Key_H: coinevent->setKey(SoKeyboardEvent::H); break;
  case Qt::Key_I: coinevent->setKey(SoKeyboardEvent::I); break;
  case Qt::Key_J: coinevent->setKey(SoKeyboardEvent::J); break;
  case Qt::Key_K: coinevent->setKey(SoKeyboardEvent::K); break;
  case Qt::Key_L: coinevent->setKey(SoKeyboardEvent::L); break;
  case Qt::Key_M: coinevent->setKey(SoKeyboardEvent::M); break;
  case Qt::Key_N: coinevent->setKey(SoKeyboardEvent::N); break;
  case Qt::Key_O: coinevent->setKey(SoKeyboardEvent::O); break;
  case Qt::Key_P: coinevent->setKey(SoKeyboardEvent::P); break;
  case Qt::Key_Q: coinevent->setKey(SoKeyboardEvent::Q); break;
  case Qt::Key_R: coinevent->setKey(SoKeyboardEvent::R); break;
  case Qt::Key_S: coinevent->setKey(SoKeyboardEvent::S); break;
  case Qt::Key_T: coinevent->setKey(SoKeyboardEvent::T); break;
  case Qt::Key_U: coinevent->setKey(SoKeyboardEvent::U); break;
  case Qt::Key_V: coinevent->setKey(SoKeyboardEvent::V); break;
  case Qt::Key_W: coinevent->setKey(SoKeyboardEvent::W); break;
  case Qt::Key_X: coinevent->setKey(SoKeyboardEvent::X); break;
  case Qt::Key_Y: coinevent->setKey(SoKeyboardEvent::Y); break;
  case Qt::Key_Z: coinevent->setKey(SoKeyboardEvent::Z); break;

  case Qt::Key_0: coinevent->setKey(SoKeyboardEvent::NUMBER_0); break;
  case Qt::Key_1: coinevent->setKey(SoKeyboardEvent::NUMBER_1); break;
  case Qt::Key_2: coinevent->setKey(SoKeyboardEvent::NUMBER_2); break;
  case Qt::Key_3: coinevent->setKey(SoKeyboardEvent::NUMBER_3); break;
  case Qt::Key_4: coinevent->setKey(SoKeyboardEvent::NUMBER_4); break;
  case Qt::Key_5: coinevent->setKey(SoKeyboardEvent::NUMBER_5); break;
  case Qt::Key_6: coinevent->setKey(SoKeyboardEvent::NUMBER_6); break;
  case Qt::Key_7: coinevent->setKey(SoKeyboardEvent::NUMBER_7); break;
  case Qt::Key_8: coinevent->setKey(SoKeyboardEvent::NUMBER_8); break;
  case Qt::Key_9: coinevent->setKey(SoKeyboardEvent::NUMBER_9); break;

  // no way to distinguish between left and right
  case Qt::Key_Shift: coinevent->setKey(SoKeyboardEvent::LEFT_SHIFT); break;
  case Qt::Key_Control: coinevent->setKey(SoKeyboardEvent::LEFT_CONTROL); break;
  case Qt::Key_Alt: coinevent->setKey(SoKeyboardEvent::LEFT_ALT); break;

  // can't handle them all...
  default: break;
  }

  // and the modifiers...
  coinevent->setShiftDown(qtevent->modifiers() & Qt::SHIFT);
  coinevent->setCtrlDown(qtevent->modifiers() & Qt::CTRL);
  coinevent->setAltDown(qtevent->modifiers() & Qt::ALT);
}

void
CoinWidget::keyPressEvent(QKeyEvent * event)
{
  PRIVATE(this)->keyboard->setTime(SbTime());
  PRIVATE(this)->keyboard->setPosition(PRIVATE(this)->location2->getPosition());

  PRIVATE(this)->keyboard->setState(SoButtonEvent::DOWN);
  PRIVATE(this)->keyboard->setKey(SoKeyboardEvent::ANY);
  setKey(PRIVATE(this)->keyboard, event);

  PRIVATE(this)->scenemanager->processEvent(PRIVATE(this)->keyboard);
}

void
CoinWidget::keyReleaseEvent(QKeyEvent * event)
{
  PRIVATE(this)->keyboard->setTime(SbTime());
  PRIVATE(this)->keyboard->setPosition(PRIVATE(this)->location2->getPosition());

  PRIVATE(this)->keyboard->setState(SoButtonEvent::UP);
  PRIVATE(this)->keyboard->setKey(SoKeyboardEvent::ANY);
  setKey(PRIVATE(this)->keyboard, event);

  PRIVATE(this)->scenemanager->processEvent(PRIVATE(this)->keyboard);
}

void 
CoinWidget::dragEnterEvent(QDragEnterEvent * event)
{
  const QMimeData * mimedata = event->mimeData();
  if (!mimedata->hasUrls()) { return; }

  QFileInfo fileinfo(mimedata->urls().takeFirst().path());
  QString suffix = fileinfo.suffix().toLower();
  if (!(PRIVATE(this)->suffixes.contains(suffix))) { return; }
  
  event->acceptProposedAction();
}

void 
CoinWidget::dropEvent(QDropEvent * event)
{
  const QMimeData * mimedata = event->mimeData();
  if (!mimedata->hasUrls()) { return; }
  
  QString path = mimedata->urls().takeFirst().path();
  
  // attempt to open file
  SoInput in;
  SbBool ok = in.openFile(path.toLatin1().constData());
  if (!ok) { return; }
  
  // attempt to import it
  SoSeparator * root = SoDB::readAll(&in);
  if (root == NULL) { return; }
  
  this->setSceneGraph(root);
  PRIVATE(this)->scenemanager->scheduleRedraw();
}

#undef PRIVATE
