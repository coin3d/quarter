#include "QuarterP.h"
#include "SensorManager.h"
#include "ImageReader.h"
#include "devices/KeyboardHandlerP.h"

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
  if (KeyboardHandlerP::keyboardmap != NULL) {
    KeyboardHandlerP::keyboardmap->clear();
    KeyboardHandlerP::keypadmap->clear();
    delete KeyboardHandlerP::keyboardmap;
    delete KeyboardHandlerP::keypadmap;
    KeyboardHandlerP::keyboardmap = NULL;
    KeyboardHandlerP::keypadmap = NULL;
  }
}
