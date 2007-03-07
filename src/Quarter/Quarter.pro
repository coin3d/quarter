TEMPLATE = lib
TARGET = Quarter

QT += opengl
CONFIG += debug designer

INCLUDEPATH += ../../include
INCLUDEPATH += $(COINDIR)/include

HEADERS = ../../include/Quarter/CoinWidget.h \
          ../../include/Quarter/CoinApplication.h \
          ../../include/Quarter/Quarter.h \
          ../../include/Quarter/devices/DeviceHandler.h \
          ../../include/Quarter/devices/MouseHandler.h \
          ../../include/Quarter/devices/KeyboardHandler.h \
          ../../include/Quarter/devices/DeviceManager.h \
          ../../include/Quarter/devices/DragDropHandler.h \
          SensorManager.h

SOURCES = CoinWidget.cpp \
          CoinApplication.cpp \
          Quarter.cpp \
          SensorManager.cpp \
          devices/DeviceManager.cpp \
          devices/DeviceHandler.cpp \
          devices/MouseHandler.cpp \
          devices/KeyboardHandler.cpp \
          devices/DragDropHandler.cpp

LIBS += -L$(COINDIR)/lib -lCoin -lNutsnBolts

MOC_DIR = .moc
OBJECTS_DIR = .obj

headers.files = ../../include
target.path = $$(COINDIR)/lib
headers.path = $$(COINDIR)

INSTALLS += target 
INSTALLS += headers
