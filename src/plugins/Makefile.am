
DEFAULT_INCLUDES = \
        -I$(top_srcdir)/include \
        -I$(top_builddir)/include \
        -I$(QTDIR)/include/QtOpenGL \
        -I$(QTDIR)/include/QtGui \
        -I$(QTDIR)/include/QtCore \
        -I$(QTDIR)/include/QtUiTools \
        -I$(QTDIR)/include/QtDesigner

PrivateHeaders = QuarterWidgetPlugin.h
RegularSources = QuarterWidgetPlugin.cpp
BuiltSources = moc_QuarterWidgetPlugin.cpp

libQuarterWidgetPlugin_la_SOURCES = \
        $(RegularSources) $(BuiltSources) $(PrivateHeaders)

lib_LTLIBRARIES = libQuarterWidgetPlugin.la
libQuarterWidgetPlugin_la_LIBADD = -L../Quarter -lQuarter -lQtUiTools -lQtDesigner
libdir = $(QTDIR)/plugins/designer

CLEANFILES = $(BuiltSources)

moc_QuarterWidgetPlugin.cpp: $(srcdir)/QuarterWidgetPlugin.h
	$(MOC) -o $@ $(srcdir)/QuarterWidgetPlugin.h $(DEFAULT_INCLUDES)