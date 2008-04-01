
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

BuiltSources =
PrivateHeaders =

RegularSources = \
        EventManager.cpp \
        EventHandler.cpp \
        DragDropHandler.cpp

BUILT_SOURCES = $(BuiltSources)

libeventhandlers_la_SOURCES = \
        $(RegularSources) $(PrivateHeaders) 

eventhandlers_lst_SOURCES = \
        $(RegularSources) $(PrivateHeaders) 

nodist_libeventhandlers_la_SOURCES = \
        $(BuiltSources)

nodist_eventhandlers_lst_SOURCES = \
        $(BuiltSources)

eventhandlers_lst_CPPFLAGS = \
        $(QUARTER_BUILD_CPPFLAGS) $(COIN_USE_CPPFLAGS) $(QT_USE_CPPFLAGS)

eventhandlers_lst_CXXFLAGS = \
        $(QUARTER_BUILD_CXXFLAGS) $(COIN_USE_CXXFLAGS) $(QT_USE_CXXFLAGS)

eventhandlers_lst_CFLAGS = \
        $(QUARTER_BUILD_CFLAGS) $(COIN_USE_CFLAGS) $(QT_USE_CFLAGS)

libeventhandlers_la_CPPFLAGS = \
        $(QUARTER_BUILD_CPPFLAGS) $(COIN_USE_CPPFLAGS) $(QT_USE_CPPFLAGS)

libeventhandlers_la_CXXFLAGS = \
        $(QUARTER_BUILD_CXXFLAGS) $(COIN_USE_CXXFLAGS) $(QT_USE_CXXFLAGS)

libeventhandlers_la_CFLAGS = \
        $(QUARTER_BUILD_CFLAGS) $(COIN_USE_CFLAGS) $(QT_USE_CFLAGS)

CLEANFILES = .\#* *.bak *~ *.lst $(BuiltSources)

if BUILD_WITH_MSVC
noinst_LIBRARIES = eventhandlers.lst
else
noinst_LTLIBRARIES = libeventhandlers.la
endif

eventhandlers.lst: $(eventhandlers_lst_OBJECTS)
	@echo "Linking $@..."; \
	rm -f $@; \
	for obj in $(eventhandlers_lst_OBJECTS); do \
	  echo $$obj >>$@; \
	done
