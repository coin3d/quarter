#include "InteractionMode.h"
#include <QCoreApplication>
#include <QKeyEvent>
#include <QFocusEvent>
#include <Quarter/QuarterWidget.h>


/*
  Adjust how QuarterWidget reacts to alt key events
 */

using namespace SIM::Coin3D::Quarter;

InteractionMode::InteractionMode(QuarterWidget * quarterwidget)
  : QObject(quarterwidget)
{
  this->quarterwidget = quarterwidget;
  this->altkeydown = false;
  this->prevcursor = QCursor();
  this->prevnavstate =
    this->quarterwidget->getSoEventManager()->getNavigationState();

  this->isenabled = true;
  this->ison = false;
  this->isinteractive = false;
}

InteractionMode::~InteractionMode()
{

}

void
InteractionMode::setEnabled(bool yes)
{
  this->isenabled = yes;
}

bool
InteractionMode::enabled(void) const
{
  return this->isenabled;
}

void InteractionMode::setOn(bool on)
{
  if (!this->isenabled) {
    return;
  }

  this->ison = on;
  updateNavigationState();
}


void InteractionMode::updateNavigationState()
{
	bool interactive = (this->ison != this->altkeydown);
	if (interactive == this->isinteractive)
	{
		return;
	}

	SoEventManager *eventmanager = this->quarterwidget->getSoEventManager();
	if (interactive)
	{
		this->prevnavstate = eventmanager->getNavigationState();
		this->prevcursor = this->quarterwidget->cursor();
		this->quarterwidget->setCursor(
		    this->quarterwidget->stateCursor("interact"));
		eventmanager->setNavigationState(SoEventManager::NO_NAVIGATION);
	}
	else
	{
		this->quarterwidget->setCursor(this->prevcursor);
		eventmanager->setNavigationState(this->prevnavstate);
	}

	this->isinteractive = interactive;
}


bool InteractionMode::on(void) const
{
  return this->ison;
}

bool
InteractionMode::eventFilter(QObject * obj, QEvent * event)
{
  if (!this->isenabled) {
    return false;
  }

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
InteractionMode::keyPressEvent(QKeyEvent * event)
{
  if (!event ||
      !(event->key() == Qt::Key_Alt) ||
      !(event->modifiers() & Qt::AltModifier)) {
    return false;
  }

  this->altkeydown = true;
  updateNavigationState();
  return true;
}

bool
InteractionMode::keyReleaseEvent(QKeyEvent * event)
{
  if (!event || !(event->key() == Qt::Key_Alt)) {
    return false;
  }

  this->altkeydown = false;
  updateNavigationState();
  return true;
}

/*
  if we lose focus while alt is down, send an alt-release event
 */
bool
InteractionMode::focusOutEvent(QFocusEvent * event)
{
  if (this->altkeydown) {
    QKeyEvent keyevent(QEvent::KeyRelease, Qt::Key_Alt, Qt::NoModifier);
    return QCoreApplication::sendEvent(this->quarterwidget, &keyevent);
  }
  return false;
}
