TEMPLATE = app

CONFIG += qtestlib
QT += opengl

DEPENDPATH += .
INCLUDEPATH += .

INCLUDEPATH += $(COINDIR)/include
LIBS += -L$(COINDIR)/lib -lCoin -lQuarter


# Input
HEADERS += EventTranslation.h
SOURCES += events.cpp \
           EventTranslation.cpp \
           ../../Quarter/devices/KeyboardHandlerP.cpp
