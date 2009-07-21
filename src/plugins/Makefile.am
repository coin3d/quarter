if BUILD_WITH_MSVC
includes = \
        -I$(QTDIR)/include \
        -I$(QTDIR)/include/QtOpenGL \
        -I$(top_srcdir)/include \
        -I$(top_srcdir)/src/Quarter
else
includes = \
        -I$(top_srcdir)/include \
        -I$(top_srcdir)/src/Quarter
endif

DEFAULT_INCLUDES = $(includes)

if MAC_QT_FRAMEWORK
QT_DESIGNER_INCLUDE = -I$(QT_USE_INCDIR)/QtDesigner.framework/Headers
else 
QT_DESIGNER_INCLUDE = -I`$(UNIX2WINPATH) $(QT_USE_INCDIR)`/QtDesigner
endif

# Add this to libQuarterWidgetPlugin_la_LDFLAGS (see below) to force
# twolevel namespace libraries on Mac OS X. This has been the way to
# do it since Mac OS 10.2, but unfortunately the version of libtool we
# are using defaults to flat_namespace. (No comment...)
if MACOSX_10_2FF
LibtoolLinkArgs = -Wl,-twolevel_namespace -Wl,-undefined,error
else
LibtoolLinkArgs = 
endif

PrivateHeaders = QuarterWidgetPlugin.h
RegularSources = QuarterWidgetPlugin.cpp
BuiltSources = \
        moc_QuarterWidgetPlugin.cpp \
        qrc_coinlogo.cpp

BUILT_SOURCES = $(BuiltSources)

libQuarterWidgetPlugin_la_SOURCES = \
        $(RegularSources) $(PrivateHeaders)

QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@@SUFFIX@_lib_SOURCES = \
        $(RegularSources) $(PrivateHeaders)

nodist_libQuarterWidgetPlugin_la_SOURCES = \
        $(BuiltSources)

nodist_QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@@SUFFIX@_lib_SOURCES = \
        $(BuiltSources)

EXTRA_DIST = \
        coinlogo.qrc \
        coinlogo.png


if BUILD_WITH_MSVC
lib_LIBRARIES = QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@@SUFFIX@.lib
else
lib_LTLIBRARIES = libQuarterWidgetPlugin.la
endif

libQuarterWidgetPlugin_la_LIBADD = \
        $(QUARTER_USE_LIBS) $(COIN_USE_LIBS) $(QT_USE_LIBS)

QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@@SUFFIX@_lib_LIBADD = \
        $(QUARTER_USE_LIBS) $(COIN_USE_LIBS) $(QT_USE_LIBS)

QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@@SUFFIX@_lib_CPPFLAGS = \
        $(PLUGIN_BUILD_CPPFLAGS) $(QUARTER_USE_CPPFLAGS) $(COIN_USE_CPPFLAGS) $(QT_USE_CPPFLAGS) $(QT_DESIGNER_INCLUDE)

QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@@SUFFIX@_lib_CXXFLAGS = \
        $(PLUGIN_BUILD_CXXFLAGS) $(COIN_USE_CXXFLAGS) $(QT_USE_CXXFLAGS)

QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@@SUFFIX@_lib_CFLAGS = \
        $(PLUGIN_BUILD_CFLAGS) $(COIN_USE_CFLAGS) $(QT_USE_CFLAGS)

libQuarterWidgetPlugin_la_CPPFLAGS = \
        $(PLUGIN_BUILD_CPPFLAGS) $(QUARTER_USE_CPPFLAGS) $(COIN_USE_CPPFLAGS) $(QT_USE_CPPFLAGS) $(QT_DESIGNER_INCLUDE)

libQuarterWidgetPlugin_la_CXXFLAGS = \
        $(PLUGIN_BUILD_CXXFLAGS) $(COIN_USE_CXXFLAGS) $(QT_USE_CXXFLAGS)

libQuarterWidgetPlugin_la_CFLAGS = \
        $(PLUGIN_BUILD_CFLAGS) $(COIN_USE_CPPFLAGS) $(QT_USE_CPPFLAGS)

libQuarterWidgetPlugin_la_LDFLAGS = \
        -no-undefined \
        $(LibtoolLinkArgs) $(QT_USE_LDFLAGS) $(QUARTER_USE_LDFLAGS) $(COIN_USE_LDFLAGS) 

libdir = $(QT_DESIGNER_PLUGIN_PATH)
bindir = $(QT_DESIGNER_PLUGIN_PATH)

CLEANFILES = \
        $(BuiltSources) \
        QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@@SUFFIX@.lib \
        QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@@SUFFIX@.dll \
        QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@@SUFFIX@.exp \
        QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@@SUFFIX@.pdb \
        QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@@SUFFIX@.dll.manifest

QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@@SUFFIX@.lib: Makefile \
	$(QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@@SUFFIX@_lib_OBJECTS) \
	$(QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@@SUFFIX@_lib_DEPENDENCIES)
	@basename="QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@@SUFFIX@"; \
	rm -f "$$basename.dll" "$$basename.lib"; \
	echo "Linking $$basename.lib..."; \
	echo $(CC) $(LDFLAGS) \
          $(PLUGIN_BUILD_LIBFLAGS) \
	  $(QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@@SUFFIX@_lib_OBJECTS) \
	  $(QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@@SUFFIX@_lib_LIBADD) \
          $(QUARTER_USE_LDFLAGS) \
          $(COIN_USE_LDFLAGS) \
          $(QT_USE_LDFLAGS)
	$(CC) $(LDFLAGS) \
          $(PLUGIN_BUILD_LIBFLAGS) \
	  $(QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@@SUFFIX@_lib_OBJECTS) \
	  $(QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@@SUFFIX@_lib_LIBADD) \
          $(QUARTER_USE_LDFLAGS) \
          $(COIN_USE_LDFLAGS) \
          $(QT_USE_LDFLAGS)

moc_QuarterWidgetPlugin.cpp: $(srcdir)/QuarterWidgetPlugin.h
	$(MOC) -o $@ `$(UNIX2WINPATH) $(srcdir)/QuarterWidgetPlugin.h` $(DEFAULT_INCLUDES) $(QT_DESIGNER_INCLUDE)

qrc_coinlogo.cpp: $(srcdir)/coinlogo.qrc
	$(RCC) -name coinlogo -o $@ `$(UNIX2WINPATH) $(srcdir)/coinlogo.qrc`

if BUILD_WITH_MSVC
all-local: QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@@SUFFIX@.lib

install-exec-local: QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@@SUFFIX@.lib
	@basename="QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@@SUFFIX@"; \
	for ext in dll pdb; do \
	  file="$$basename.$$ext"; \
	  if test -s "$$file"; then \
	    $(mkinstalldirs) "$(DESTDIR)$(bindir)"; \
	    echo $(INSTALL_PROGRAM) "$$file" "$(DESTDIR)$(bindir)/$$file"; \
	    $(INSTALL_PROGRAM) "$$file" "$(DESTDIR)$(bindir)/$$file" || exit 1; \
	  fi \
	done
else
install-exec-local:
endif

install-data-local:
	@basename="QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@@SUFFIX@"; \
	for ext in lib; do \
	  file="$$basename.$$ext"; \
	  if test -s "$$file"; then \
	    $(mkinstalldirs) "$(DESTDIR)$(libdir)"; \
	    echo $(INSTALL_PROGRAM) "$$file" "$(DESTDIR)$(libdir)/$$file"; \
	    $(INSTALL_PROGRAM) "$$file" "$(DESTDIR)$(libdir)/$$file" || exit 1; \
	  fi \
	done

uninstall-local:
	@basename="QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@@SUFFIX@"; \
	for file in \
	  "$(DESTDIR)$(bindir)/$$basename.dll" \
	  "$(DESTDIR)$(bindir)/$$basename.pdb" \
	  "$(DESTDIR)$(libdir)/$$basename.lib"; do \
	  if test -f "$$file"; then \
	    echo " rm -f" "$$file"; \
	    rm -f "$$file"; \
	  fi \
	done
