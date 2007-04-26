
DEFAULT_INCLUDES = \
        -I$(QTDIR)/include/QtOpenGL \
        -I$(QTDIR)/include/QtGui \
        -I$(QTDIR)/include/QtCore \
        -I$(top_srcdir)/include \
        -I$(top_srcdir)/src/Quarter

PrivateHeaders = \
        KeyboardHandlerP.h

RegularSources = \
        DeviceManager.cpp \
        MouseHandler.cpp \
        KeyboardHandler.cpp \
        DragDropHandler.cpp \
        DeviceHandler.cpp \
        KeyboardHandlerP.cpp

libdevices_la_SOURCES = \
        $(RegularSources) $(PrivateHeaders)

noinst_LTLIBRARIES = libdevices.la