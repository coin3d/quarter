#ifndef QUARTER_QUARTERWIDGET_H
#define QUARTER_QUARTERWIDGET_H

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
#include <Inventor/SoRenderManager.h>
#include <Inventor/actions/SoGLRenderAction.h>

#include <QtGui/QColor>
#include <QtCore/QUrl>
#include <QtOpenGL/QGLWidget>
#include <Quarter/Basic.h>

class QMenu;
class SoNode;
class SoEvent;
class SoCamera;
class SoEventManager;
class SoRenderManager;
class SoDirectionalLight;
class SoScXMLStateMachine;

namespace SIM { namespace Coin3D { namespace Quarter {

class EventFilter;
const char DEFAULT_NAVIGATIONFILE []  = "coin:///scxml/navigation/examiner.xml";

class QUARTER_DLL_API QuarterWidget : public QGLWidget {
  typedef QGLWidget inherited;
  Q_OBJECT

    Q_PROPERTY(QUrl navigationModeFile READ navigationModeFile WRITE setNavigationModeFile RESET resetNavigationModeFile)
  Q_PROPERTY(QColor backgroundColor READ backgroundColor WRITE setBackgroundColor)
  Q_PROPERTY(bool contextMenuEnabled READ contextMenuEnabled WRITE setContextMenuEnabled)
  Q_PROPERTY(bool headlightEnabled READ headlightEnabled WRITE setHeadlightEnabled)
  Q_PROPERTY(bool clearZBuffer READ clearZBuffer WRITE setClearZBuffer)
  Q_PROPERTY(bool clearWindow READ clearWindow WRITE setClearWindow)
  Q_PROPERTY(bool interactionModeEnabled READ interactionModeEnabled WRITE setInteractionModeEnabled);
  Q_PROPERTY(bool interactionModeOn READ interactionModeOn WRITE setInteractionModeOn);

  Q_PROPERTY(TransparencyType transparencyType READ transparencyType WRITE setTransparencyType)
  Q_PROPERTY(RenderMode renderMode READ renderMode WRITE setRenderMode)
  Q_PROPERTY(StereoMode stereoMode READ stereoMode WRITE setStereoMode)

  Q_ENUMS(TransparencyType)
  Q_ENUMS(RenderMode)
  Q_ENUMS(StereoMode)


public:
  explicit QuarterWidget(QWidget * parent = 0, const QGLWidget * sharewidget = 0, Qt::WindowFlags f = 0);
  explicit QuarterWidget(QGLContext * context, QWidget * parent = 0, const QGLWidget * sharewidget = 0, Qt::WindowFlags f = 0);
  explicit QuarterWidget(const QGLFormat & format, QWidget * parent = 0, const QGLWidget * shareWidget = 0, Qt::WindowFlags f = 0);
  virtual ~QuarterWidget();

  enum TransparencyType {
    SCREEN_DOOR = SoGLRenderAction::SCREEN_DOOR,
    ADD = SoGLRenderAction::ADD,
    DELAYED_ADD = SoGLRenderAction::DELAYED_ADD,
    SORTED_OBJECT_ADD = SoGLRenderAction::SORTED_OBJECT_ADD,
    BLEND = SoGLRenderAction::BLEND,
    DELAYED_BLEND = SoGLRenderAction::DELAYED_BLEND,
    SORTED_OBJECT_BLEND = SoGLRenderAction::SORTED_OBJECT_BLEND,
    SORTED_OBJECT_SORTED_TRIANGLE_ADD = SoGLRenderAction::SORTED_OBJECT_SORTED_TRIANGLE_ADD,
    SORTED_OBJECT_SORTED_TRIANGLE_BLEND = SoGLRenderAction::SORTED_OBJECT_SORTED_TRIANGLE_BLEND,
    NONE = SoGLRenderAction::NONE,
    SORTED_LAYERS_BLEND = SoGLRenderAction::SORTED_LAYERS_BLEND
  };

  enum RenderMode {
    AS_IS = SoRenderManager::AS_IS,
    WIREFRAME = SoRenderManager::WIREFRAME,
    WIREFRAME_OVERLAY = SoRenderManager::WIREFRAME_OVERLAY,
    POINTS = SoRenderManager::POINTS,
    HIDDEN_LINE = SoRenderManager::HIDDEN_LINE,
    BOUNDING_BOX = SoRenderManager::BOUNDING_BOX
  };

  enum StereoMode {
    MONO = SoRenderManager::MONO,
    ANAGLYPH = SoRenderManager::ANAGLYPH,
    QUAD_BUFFER = SoRenderManager::QUAD_BUFFER,
    INTERLEAVED_ROWS = SoRenderManager::INTERLEAVED_ROWS,
    INTERLEAVED_COLUMNS = SoRenderManager::INTERLEAVED_COLUMNS
  };

  TransparencyType transparencyType(void) const;
  RenderMode renderMode(void) const;
  StereoMode stereoMode(void) const;

  void setBackgroundColor(const QColor & color);
  QColor backgroundColor(void) const;

  void resetNavigationModeFile(void);
  void setNavigationModeFile(const QUrl & url = QUrl(DEFAULT_NAVIGATIONFILE));
  const QUrl & navigationModeFile(void) const;

  void setContextMenuEnabled(bool yes);
  bool contextMenuEnabled(void) const;
  QMenu * getContextMenu(void) const;

  bool headlightEnabled(void) const;
  void setHeadlightEnabled(bool onoff);
  SoDirectionalLight * getHeadlight(void);

  bool clearZBuffer(void) const;
  void setClearZBuffer(bool onoff);

  bool clearWindow(void) const;
  void setClearWindow(bool onoff);

  bool interactionModeEnabled(void) const;
  void setInteractionModeEnabled(bool onoff);

  bool interactionModeOn(void) const;
  void setInteractionModeOn(bool onoff);

  void setStateCursor(const SbName & state, const QCursor & cursor);
  QCursor stateCursor(const SbName & state);

  uint32_t getCacheContextId(void) const;

  virtual void setSceneGraph(SoNode * root);
  virtual SoNode * getSceneGraph(void) const;

  void setSoEventManager(SoEventManager * manager);
  SoEventManager * getSoEventManager(void) const;

  void setSoRenderManager(SoRenderManager * manager);
  SoRenderManager * getSoRenderManager(void) const;

  EventFilter * getEventFilter(void) const;

  void addStateMachine(SoScXMLStateMachine * statemachine);
  void removeStateMachine(SoScXMLStateMachine * statemachine);

  virtual bool processSoEvent(const SoEvent * event);
  virtual QSize minimumSizeHint(void) const;

  QList<QAction *> transparencyTypeActions(void) const;
  QList<QAction *> stereoModeActions(void) const;
  QList<QAction *> renderModeActions(void) const;

public slots:
  virtual void viewAll(void);
  virtual void seek(void);

  void redraw(void);

  void setRenderMode(RenderMode mode);
  void setStereoMode(StereoMode mode);
  void setTransparencyType(TransparencyType type);

protected:
  virtual void resizeGL(int width, int height);
  virtual void initializeGL(void);
  virtual void paintGL(void);
  virtual void actualRedraw(void);

private:
  void constructor(const QGLWidget * sharewidget);
  friend class QuarterWidgetP;
  class QuarterWidgetP * pimpl;
};

}}} // namespace

#endif // QUARTER_QUARTERWIDGET_H
