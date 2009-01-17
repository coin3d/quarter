#ifndef QUARTER_QUARTERP_H
#define QUARTER_QUARTERP_H

namespace SIM { namespace Coin3D { namespace Quarter {

class QuarterP {
 public:
  QuarterP();
  ~QuarterP();

  class SensorManager * sensormanager;
  class ImageReader * imagereader;

  bool initCoin;
};

}}};

#endif //QUARTER_QUARTERP_H
