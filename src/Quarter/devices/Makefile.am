
if BUILD_WITH_MSVC
includes = \
        -I$(QTDIR)/include \
        -I$(QTDIR)/include/QtOpenGL \
        -I$(QTDIR)/include/QtGui \
        -I$(QTDIR)/include/QtCore \
        -I$(top_srcdir)/include \
        -I$(top_srcdir)/src/Quarter
else
includes = \
        -I$(top_srcdir)/include \
        -I$(top_srcdir)/src/Quarter
endif

DEFAULT_INCLUDES = $(includes)

PrivateHeaders = \
        KeyboardP.h

RegularSources = \
        Mouse.cpp \
        Keyboard.cpp \
        InputDevice.cpp \
        KeyboardP.cpp

libdevices_la_SOURCES = \
        $(RegularSources) $(PrivateHeaders)

devices_lst_SOURCES = \
        $(RegularSources) $(PrivateHeaders)

devices_lst_CPPFLAGS = \
        $(QUARTER_BUILD_CPPFLAGS) $(COIN_USE_CPPFLAGS) $(QT_USE_CPPFLAGS)

devices_lst_CXXFLAGS = \
        $(QUARTER_BUILD_CXXFLAGS) $(COIN_USE_CXXFLAGS) $(QT_USE_CXXFLAGS)

devices_lst_CFLAGS = \
        $(QUARTER_BUILD_CFLAGS) $(COIN_USE_CFLAGS) $(QT_USE_CFLAGS)

libdevices_la_CPPFLAGS = \
        $(QUARTER_BUILD_CPPFLAGS) $(COIN_USE_CPPFLAGS) $(QT_USE_CPPFLAGS)

libdevices_la_CXXFLAGS = \
        $(QUARTER_BUILD_CXXFLAGS) $(COIN_USE_CXXFLAGS) $(QT_USE_CXXFLAGS)

libdevices_la_CFLAGS = \
        $(QUARTER_BUILD_CFLAGS) $(COIN_USE_CFLAGS) $(QT_USE_CFLAGS)

CLEANFILES = .\#* *.bak *~ *.lst


if BUILD_WITH_MSVC
noinst_LIBRARIES = devices.lst
else
noinst_LTLIBRARIES = libdevices.la
endif

devices.lst: $(devices_lst_OBJECTS)
	@echo "Linking $@..."; \
	rm -f $@; \
	for obj in $(devices_lst_OBJECTS); do \
	  echo $$obj >>$@; \
	done
