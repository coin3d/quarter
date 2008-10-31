#include "QuarterP.h"
#include "SensorManager.h"
#include "ImageReader.h"
#include "devices/KeyboardP.h"

using namespace SIM::Coin3D::Quarter;

QuarterP::QuarterP(void)
{
  this->sensormanager = new SensorManager;
  this->imagereader = new ImageReader;

}

QuarterP::~QuarterP()
{
  delete this->imagereader;
  delete this->sensormanager;

  // FIXME: Why not use an atexit mechanism for this?
  if (KeyboardP::keyboardmap != NULL) {
    KeyboardP::keyboardmap->clear();
    KeyboardP::keypadmap->clear();
    delete KeyboardP::keyboardmap;
    delete KeyboardP::keypadmap;
    KeyboardP::keyboardmap = NULL;
    KeyboardP::keypadmap = NULL;
  }
}
