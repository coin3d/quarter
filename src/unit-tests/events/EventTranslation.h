#ifndef QUARTER_EVENTTRANSLATION_H
#define QUARTER_EVENTTRANSLATION_H

#include <QtGui>
#include <QtTest/QtTest>

#include <Quarter/Quarter.h>
#include <Quarter/QuarterWidget.h>

using namespace SIM::Coin3D::Quarter;

class EventTranslation : public QObject {
  Q_OBJECT

private slots:
  void initTestCase(void);
  void cleanupTestCase(void);
  void translateKeyboardEvents_data(void);
  void translateKeyboardEvents(void);
  void translateKeypadEvents_data(void);
  void translateKeypadEvents(void);

private:
  class QuarterWidget * quarterwidget;
};

#endif // QUARTER_EVENTTRANSLATION_Hx
