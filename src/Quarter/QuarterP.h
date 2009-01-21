#ifndef QUARTER_QUARTERP_H
#define QUARTER_QUARTERP_H
#include <Inventor/SbName.h>
#include <QtGui/QCursor>

template <class Key, class T> class QMap;

namespace SIM { namespace Coin3D { namespace Quarter {

class QuarterP {
 public:
  QuarterP();
  ~QuarterP();

  class SensorManager * sensormanager;
  class ImageReader * imagereader;

  typedef QMap<SbName, QCursor> StateCursorMap;
  static StateCursorMap * statecursormap;

  bool initCoin;
};

}}};

#endif //QUARTER_QUARTERP_H
