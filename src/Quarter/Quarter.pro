TEMPLATE = lib
TARGET = Quarter

QT += opengl
CONFIG += debug designer

INCLUDEPATH += ../../include
INCLUDEPATH += $(COINDIR)/include

HEADERS = ../../include/Quarter/CoinWidget.h \
          ../../include/Quarter/CoinApplication.h \
          ../../include/Quarter/Quarter.h \
          ../../include/Quarter/DeviceHandler.h \
          ../../include/Quarter/MouseHandler.h \
          ../../include/Quarter/KeyboardHandler.h \
          ../../include/Quarter/DeviceManager.h \
          SensorManager.h

SOURCES = CoinWidget.cpp \
          CoinApplication.cpp \
          Quarter.cpp \
          SensorManager.cpp \
          DeviceManager.cpp \
          MouseHandler.cpp \
          KeyboardHandler.cpp

LIBS += -L$(COINDIR)/lib -lCoin -lNutsnBolts

MOC_DIR = .moc
OBJECTS_DIR = .obj

headers.files = ../../include
target.path = $$(COINDIR)/lib
headers.path = $$(COINDIR)

INSTALLS += target 
INSTALLS += headers
