
#include <Quarter/Quarter.h>

#include <Inventor/SoDB.h>
#include <Inventor/nodekits/SoNodeKit.h>
#include <NutsnBolts/NutsnBolts.h>

#include "SensorManager.h"

static Quarter * self = NULL;

Quarter::Quarter(void)
{
  this->sensormanager = new SensorManager;
}

Quarter::~Quarter()
{
  delete this->sensormanager;
}

void
Quarter::init(void)
{
  if (self) {
    fprintf(stderr, "Quarter is already initialized\n");
    return;
  }
  
  SoDB::init();
  SoNodeKit::init();
  NutsnBolts::init();
  
  self = new Quarter;
}

void
Quarter::clean(void)
{
  assert(self);
  delete self;
}

#undef PRIVATE
