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

#include "QuarterWidgetP.h"
#include <Quarter/QuarterWidget.h>
#include <Quarter/eventhandlers/EventFilter.h>

#include <QtGui/QCursor>
#include <QtGui/QMenu>
#include <QtCore/QMap>

#include <Inventor/nodes/SoCamera.h>
#include <Inventor/nodes/SoNode.h>
#include <Inventor/actions/SoSearchAction.h>
#include <Inventor/elements/SoGLCacheContextElement.h>
#include <Inventor/lists/SbList.h>
#include <Inventor/SoEventManager.h>
#include <Inventor/scxml/SoScXMLStateMachine.h>
#include <Inventor/misc/SoContextHandler.h>

#include "ContextMenu.h"
#include "QuarterP.h"

#include <stdlib.h>

using namespace SIM::Coin3D::Quarter;

class QuarterWidgetP_cachecontext {
public:
  uint32_t id;
  SbList <const QGLWidget *> widgetlist;
};

static SbList <QuarterWidgetP_cachecontext *> * cachecontext_list = NULL;

QuarterWidgetP::QuarterWidgetP(QuarterWidget * masterptr, const QGLWidget * sharewidget)
: master(masterptr),
  scene(NULL),
  eventfilter(NULL),
  interactionmode(NULL),
  sorendermanager(NULL),
  soeventmanager(NULL),
  initialsorendermanager(false),
  initialsoeventmanager(false),
  headlight(NULL),
  cachecontext(NULL),
  contextmenu(NULL),
  contextmenuenabled(true),
  autoredrawenabled(true),
  interactionmodeenabled(false),
  clearzbuffer(true),
  clearwindow(true),
  addactions(true)
{
  this->cachecontext = findCacheContext(masterptr, sharewidget);

}

QuarterWidgetP::~QuarterWidgetP()
{
  removeFromCacheContext(this->cachecontext, this->master);
  if (this->contextmenu) {
    delete this->contextmenu;
  }
}

SoCamera *
QuarterWidgetP::searchForCamera(SoNode * root)
{
  SoSearchAction sa;
  sa.setInterest(SoSearchAction::FIRST);
  sa.setType(SoCamera::getClassTypeId());
  sa.apply(root);

  if (sa.getPath()) {
    SoNode * node = sa.getPath()->getTail();
    if (node && node->isOfType(SoCamera::getClassTypeId())) {
      return (SoCamera *) node;
    }
  }
  return NULL;
}

uint32_t
QuarterWidgetP::getCacheContextId(void) const
{
  return this->cachecontext->id;
}

QuarterWidgetP_cachecontext *
QuarterWidgetP::findCacheContext(QuarterWidget * widget, const QGLWidget * sharewidget)
{
  if (cachecontext_list == NULL) {
    // FIXME: static memory leak
    cachecontext_list = new SbList <QuarterWidgetP_cachecontext*>;
  }
  for (int i = 0; i < cachecontext_list->getLength(); i++) {
    QuarterWidgetP_cachecontext * cachecontext = (*cachecontext_list)[i];

    for (int j = 0; j < cachecontext->widgetlist.getLength(); j++) {
      if (cachecontext->widgetlist[j] == sharewidget) {
        cachecontext->widgetlist.append((const QGLWidget*) widget);
        return cachecontext;
      }
    }
  }
  QuarterWidgetP_cachecontext * cachecontext = new QuarterWidgetP_cachecontext;
  cachecontext->id = SoGLCacheContextElement::getUniqueCacheContext();
  cachecontext->widgetlist.append((const QGLWidget*) widget);
  cachecontext_list->append(cachecontext);

  return cachecontext;
}

void
QuarterWidgetP::removeFromCacheContext(QuarterWidgetP_cachecontext * context, const QGLWidget * widget)
{
  context->widgetlist.removeItem((const QGLWidget*) widget);

  if (context->widgetlist.getLength() == 0) { // last context in this share group?
    assert(cachecontext_list);

    for (int i = 0; i < cachecontext_list->getLength(); i++) {
      if ((*cachecontext_list)[i] == context) {
        cachecontext_list->removeFast(i);
        // set the context while calling destructingContext() (might trigger OpenGL calls)
        const_cast<QGLWidget*> (widget)->makeCurrent();
        SoContextHandler::destructingContext(context->id);
        const_cast<QGLWidget*> (widget)->doneCurrent();
        delete context;
        return;
      }
    }
  }
}

/*!

 */
void
QuarterWidgetP::rendercb(void * userdata, SoRenderManager *)
{
  QuarterWidget * thisp = static_cast<QuarterWidget *>(userdata);

  if (thisp->pimpl->autoredrawenabled) {
    thisp->redraw();
  }
}

void
QuarterWidgetP::prerendercb(void * userdata, SoRenderManager * manager)
{
  QuarterWidgetP * thisp = static_cast<QuarterWidgetP *>(userdata);
  SoEventManager * evman = thisp->soeventmanager;
  assert(evman);
  for (int c = 0; c < evman->getNumSoScXMLStateMachines(); ++c) {
    SoScXMLStateMachine * statemachine = evman->getSoScXMLStateMachine(c);
    statemachine->preGLRender();
  }
}

void
QuarterWidgetP::postrendercb(void * userdata, SoRenderManager * manager)
{
  QuarterWidgetP * thisp = static_cast<QuarterWidgetP *>(userdata);
  SoEventManager * evman = thisp->soeventmanager;
  assert(evman);
  for (int c = 0; c < evman->getNumSoScXMLStateMachines(); ++c) {
    SoScXMLStateMachine * statemachine = evman->getSoScXMLStateMachine(c);
    statemachine->postGLRender();
  }
}

void
QuarterWidgetP::statechangecb(void * userdata, ScXMLStateMachine * statemachine, const char * stateid, SbBool enter, SbBool)
{
  static const SbName contextmenurequest("contextmenurequest");
  QuarterWidgetP * thisp = static_cast<QuarterWidgetP *>(userdata);
  assert(thisp && thisp->master);
  if (enter) {
    SbName state(stateid);
    if (thisp->contextmenuenabled && state == contextmenurequest) {
      thisp->contextMenu()->exec(thisp->eventfilter->globalMousePosition());
    }
    if (QuarterP::statecursormap->contains(state)) {
      QCursor cursor = QuarterP::statecursormap->value(state);
      thisp->master->setCursor(cursor);
    }
  }
}

#define ADD_ACTION(enum, text, group, parent, list)     \
  do {                                                  \
    QAction * action = new QAction(text, parent);       \
    action->setCheckable(true);                         \
    action->setData(enum);                              \
    action->setObjectName(text);                        \
    action->setActionGroup(group);                      \
    list.append(action);                                \
  } while (0)


QList<QAction *>
QuarterWidgetP::transparencyTypeActions(void) const
{
  if (this->transparencytypeactions.isEmpty()) {
    this->transparencytypegroup = new QActionGroup(this->master);
    ADD_ACTION(QuarterWidget::NONE, "none", transparencytypegroup, this->master, this->transparencytypeactions);
    ADD_ACTION(QuarterWidget::SCREEN_DOOR, "screen door", transparencytypegroup, this->master, this->transparencytypeactions);
    ADD_ACTION(QuarterWidget::ADD, "add", transparencytypegroup, this->master, this->transparencytypeactions);
    ADD_ACTION(QuarterWidget::DELAYED_ADD, "delayed add", transparencytypegroup, this->master, this->transparencytypeactions);
    ADD_ACTION(QuarterWidget::SORTED_OBJECT_ADD, "sorted object add", transparencytypegroup, this->master, this->transparencytypeactions);
    ADD_ACTION(QuarterWidget::BLEND, "blend", transparencytypegroup, this->master, this->transparencytypeactions);
    ADD_ACTION(QuarterWidget::DELAYED_BLEND, "delayed blend", transparencytypegroup, this->master, this->transparencytypeactions);
    ADD_ACTION(QuarterWidget::SORTED_OBJECT_BLEND, "sorted object blend", transparencytypegroup, this->master, this->transparencytypeactions);
    ADD_ACTION(QuarterWidget::SORTED_OBJECT_SORTED_TRIANGLE_ADD, "sorted object sorted triangle add", transparencytypegroup, this->master, this->transparencytypeactions);
    ADD_ACTION(QuarterWidget::SORTED_OBJECT_SORTED_TRIANGLE_BLEND, "sorted object sorted triangle blend", transparencytypegroup, this->master, this->transparencytypeactions);
    ADD_ACTION(QuarterWidget::SORTED_LAYERS_BLEND, "sorted layers blend", transparencytypegroup, this->master, this->transparencytypeactions);
  }
  return this->transparencytypeactions;
}

QList<QAction *>
QuarterWidgetP::stereoModeActions(void) const
{
  if (this->stereomodeactions.isEmpty()) {
    this->stereomodegroup = new QActionGroup(this->master);
    ADD_ACTION(QuarterWidget::MONO, "mono", stereomodegroup, this->master, stereomodeactions);
    ADD_ACTION(QuarterWidget::ANAGLYPH, "anaglyph", stereomodegroup, this->master, stereomodeactions);
    ADD_ACTION(QuarterWidget::QUAD_BUFFER, "quad buffer", stereomodegroup, this->master, stereomodeactions);
    ADD_ACTION(QuarterWidget::INTERLEAVED_ROWS, "interleaved rows", stereomodegroup, this->master, stereomodeactions);
    ADD_ACTION(QuarterWidget::INTERLEAVED_COLUMNS, "interleaved columns", stereomodegroup, this->master, stereomodeactions);
  }
  return this->stereomodeactions;
}

QList<QAction *>
QuarterWidgetP::renderModeActions(void) const
{
  if (this->rendermodeactions.isEmpty()) {
    this->rendermodegroup = new QActionGroup(this->master);
    ADD_ACTION(QuarterWidget::AS_IS, "as is", rendermodegroup, this->master, rendermodeactions);
    ADD_ACTION(QuarterWidget::WIREFRAME, "wireframe", rendermodegroup, this->master, rendermodeactions);
    ADD_ACTION(QuarterWidget::WIREFRAME_OVERLAY, "wireframe overlay", rendermodegroup, this->master, rendermodeactions);
    ADD_ACTION(QuarterWidget::POINTS, "points", rendermodegroup, this->master, rendermodeactions);
    ADD_ACTION(QuarterWidget::HIDDEN_LINE, "hidden line", rendermodegroup, this->master, rendermodeactions);
    ADD_ACTION(QuarterWidget::BOUNDING_BOX, "bounding box", rendermodegroup, this->master, rendermodeactions);
  }
  return this->rendermodeactions;
}

#undef ADD_ACTION

QMenu *
QuarterWidgetP::contextMenu(void)
{
  if (!this->contextmenu) {
    this->contextmenu = new ContextMenu(this->master);
  }

  return this->contextmenu->getMenu();
}
