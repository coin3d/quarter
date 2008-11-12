#include "AltKeyHandler.h"
#include <QtCore/QCoreApplication>
#include <QtGui/QKeyEvent>
#include <QtGui/QFocusEvent>
#include <Quarter/QuarterWidget.h>

/*
  Adjust how QuarterWidget reacts to alt key events
 */

using namespace SIM::Coin3D::Quarter;

AltKeyHandler::AltKeyHandler(QuarterWidget * quarterwidget)
  : QObject(quarterwidget)
{
  this->quarterwidget = quarterwidget;
  this->altkeydown = false;
  this->prevcursor = QCursor();
  this->prevnavstate = 
    this->quarterwidget->getSoEventManager()->getNavigationState();
}

AltKeyHandler::~AltKeyHandler()
{

}

bool 
AltKeyHandler::eventFilter(QObject * obj, QEvent * event)
{
  assert(obj == this->quarterwidget);

  switch (event->type()) {
  case QEvent::KeyPress:
    return this->keyPressEvent(dynamic_cast<QKeyEvent *>(event));
  case QEvent::KeyRelease:
    return this->keyReleaseEvent(dynamic_cast<QKeyEvent *>(event));
  case QEvent::FocusOut:
    return this->focusOutEvent(dynamic_cast<QFocusEvent *>(event));
  default:
    return QObject::eventFilter(obj, event);
  }
}

/*
  when alt is pressed, override navigation and allow scenegraph to
  process events so draggers and manipulators works
 */
bool 
AltKeyHandler::keyPressEvent(QKeyEvent * event)
{
  if (!event || 
      !(event->key() == Qt::Key_Alt) ||
      !(event->modifiers() & Qt::AltModifier)) {
    return false;
  }

  this->altkeydown = true;
  SoEventManager * eventmanager = this->quarterwidget->getSoEventManager();
  this->prevnavstate = eventmanager->getNavigationState();
  this->prevcursor = this->quarterwidget->cursor();
  this->quarterwidget->setCursor(this->quarterwidget->stateCursor("interact")); 
  eventmanager->setNavigationState(SoEventManager::NO_NAVIGATION);
  return true;
}

bool 
AltKeyHandler::keyReleaseEvent(QKeyEvent * event)
{
  if (!event || !(event->key() == Qt::Key_Alt)) { 
    return false; 
  }

  this->altkeydown = false;
  SoEventManager * eventmanager = this->quarterwidget->getSoEventManager();
  this->quarterwidget->setCursor(this->prevcursor); 
  eventmanager->setNavigationState(this->prevnavstate);
  return true;
}

/*
  if we lose focus while alt is down, send an alt-release event
 */
bool 
AltKeyHandler::focusOutEvent(QFocusEvent * event)
{
  if (this->altkeydown) {
    QKeyEvent keyevent(QEvent::KeyRelease, Qt::Key_Alt, Qt::NoModifier);
    return QCoreApplication::sendEvent(this->quarterwidget, &keyevent);
  }
  return false;
}
