
SUBDIRS = devices

DEFAULT_INCLUDES = \
        -I$(QTDIR)/include/QtOpenGL \
        -I$(QTDIR)/include/QtGui \
        -I$(QTDIR)/include/QtCore \
        -I$(top_srcdir)/include \
        -I$(top_srcdir)/src/Quarter

BuiltSources = \
        moc_QuarterWidget.cpp \
        moc_SensorManager.cpp

PrivateHeaders = \
        SensorManager.h \
        QuarterWidgetP.h

RegularSources = \
        Quarter.cpp \
        QuarterWidget.cpp \
        SensorManager.cpp \
        QuarterWidgetP.cpp \
        QuarterApplication.cpp

libQuarter_la_SOURCES = \
        $(RegularSources) $(BuiltSources) $(PrivateHeaders)

lib_LTLIBRARIES = libQuarter.la
libQuarter_la_LIBADD = -lNutsnBolts devices/libdevices.la
CLEANFILES = $(BuiltSources)

moc_QuarterWidget.cpp: $(top_srcdir)/include/Quarter/QuarterWidget.h
	$(MOC) -o $@ $(top_srcdir)/include/Quarter/QuarterWidget.h

moc_SensorManager.cpp: $(srcdir)/SensorManager.h
	$(MOC) -o $@ $(srcdir)/SensorManager.h
