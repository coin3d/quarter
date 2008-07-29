TEMPLATE = app

CONFIG += qtestlib debug
QT += opengl

DEPENDPATH += .

INCLUDEPATH += $(COINDIR)/include $(QUARTERDIR)/include
#LIBS += -L$(COINDIR)/lib -lCoin
LIBS += -framework Inventor
LIBS += -L$(QUARTERDIR)/lib -lQuarter
#LIBS += -framework Quarter


# Input
HEADERS += EventTranslation.h
SOURCES += events.cpp \
           EventTranslation.cpp

