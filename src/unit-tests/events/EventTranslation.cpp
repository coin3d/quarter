#include "../../Quarter/devices/KeyboardHandlerP.h"
#include "EventTranslation.h"

#include <assert.h>

#include <QEvent>
#include <QTestEventList>
#include <Inventor/events/SoKeyboardEvent.h>
#include <Inventor/events/SoMouseButtonEvent.h>
#include <Inventor/events/SoLocation2Event.h>
#include <Inventor/nodes/SoSeparator.h>
#include <Inventor/nodes/SoEventCallback.h>

static SoEvent * currentevent = NULL;

static void event_cb(void * , SoEventCallback * node)
{
  currentevent = (SoEvent *) node->getEvent();
}

void
EventTranslation::initTestCase(void)
{
  Quarter::init();
  this->quarterwidget = new QuarterWidget;

  SoSeparator * root = new SoSeparator;

  SoEventCallback * eventcallback = new SoEventCallback;
  eventcallback->addEventCallback(SoEvent::getClassTypeId(),
                                  event_cb,
                                  this->quarterwidget);

  root->addChild(eventcallback);

  this->quarterwidget->setSceneGraph(root);
}

void
EventTranslation::cleanupTestCase(void)
{
  delete this->quarterwidget;
  Quarter::clean();
}

void
EventTranslation::translateKeypadEvents_data(void)
{
  QTest::addColumn<QTestEventList>("qevent");
  QTest::addColumn<int>("sokey");

  KeyboardHandlerP::KeyMap::const_iterator it =
    KeyboardHandlerP::keypadmap->constBegin();

  while (it != KeyboardHandlerP::keypadmap->constEnd()) {
    Qt::Key qkey = it.key();
    SoKeyboardEvent::Key sokey = it.value();

    QTestEventList list;
    list.addKeyPress(qkey, Qt::KeypadModifier);

    QTest::newRow("Key") << list << int(sokey);

    it++;
  }

}

void
EventTranslation::translateKeypadEvents(void)
{
  QFETCH(QTestEventList, qevent);
  QFETCH(int, sokey);

  qevent.simulate(this->quarterwidget);

  QCOMPARE(bool(currentevent->isOfType(SoKeyboardEvent::getClassTypeId())), true);

  SoKeyboardEvent * keyboardevent = (SoKeyboardEvent *) currentevent;
  QCOMPARE(int(keyboardevent->getKey()), sokey);
}

void
EventTranslation::translateKeyboardEvents_data(void)
{
  QTest::addColumn<QTestEventList>("qevent");
  QTest::addColumn<int>("sokey");
  QTest::addColumn<int>("qmodifier");

  QList<Qt::KeyboardModifier> modifiers;
  modifiers += Qt::ShiftModifier;
  modifiers += Qt::ControlModifier;
  modifiers += Qt::AltModifier;

  QVERIFY(KeyboardHandlerP::keyboardmap != NULL);
  KeyboardHandlerP::KeyMap::const_iterator it =
    KeyboardHandlerP::keyboardmap->constBegin();

  while (it != KeyboardHandlerP::keyboardmap->constEnd()) {
    Qt::Key qkey = it.key();
    SoKeyboardEvent::Key sokey = it.value();

    foreach(Qt::KeyboardModifier modifier, modifiers) {
      QTestEventList list;
      list.addKeyPress(qkey, modifier);
      QTest::newRow("Key") << list << int(sokey) << int(modifier);
    }
    it++;
  }
}

void
EventTranslation::translateKeyboardEvents(void)
{
  QFETCH(QTestEventList, qevent);
  QFETCH(int, sokey);
  QFETCH(int, qmodifier);

  qevent.simulate(this->quarterwidget);

  QCOMPARE(bool(currentevent->isOfType(SoKeyboardEvent::getClassTypeId())), true);

  SoKeyboardEvent * keyboardevent = (SoKeyboardEvent *) currentevent;
  QCOMPARE(int(keyboardevent->getKey()), sokey);

  //printf("%c", keyboardevent->getPrintableCharacter());

  if (keyboardevent->getKey() != SoKeyboardEvent::LEFT_ALT &&
      keyboardevent->getKey() != SoKeyboardEvent::LEFT_SHIFT &&
      keyboardevent->getKey() != SoKeyboardEvent::LEFT_CONTROL) {

    QCOMPARE(qmodifier == Qt::ShiftModifier, bool(keyboardevent->wasShiftDown()));
    QCOMPARE(qmodifier == Qt::ControlModifier, bool(keyboardevent->wasCtrlDown()));
    QCOMPARE(qmodifier == Qt::AltModifier, bool(keyboardevent->wasAltDown()));
  }
}
