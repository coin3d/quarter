
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

QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@_lib_SOURCES = \
        $(RegularSources) $(BuiltSources) $(PrivateHeaders)


if BUILD_WITH_MSVC
lib_LIBRARIES = QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@.lib
else
lib_LTLIBRARIES = libQuarterWidgetPlugin.la
endif

libQuarterWidgetPlugin_la_LIBADD = \
        $(QUARTER_USE_LDFLAGS) $(QUARTER_USE_LIBS) $(COIN_USE_LIBS) $(QT_USE_LIBS) -lQtUiTools -lQtDesigner -lQtOpenGL

QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@_lib_LIBADD = \
        $(QUARTER_USE_LIBS) $(COIN_USE_LIBS) $(QT_USE_LIBS) -lQtUiTools -lQtDesigner4 -lQtOpenGL4

QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@_lib_CPPFLAGS = \
        $(PLUGIN_BUILD_CPPFLAGS) $(QUARTER_USE_CPPFLAGS) $(COIN_USE_CPPFLAGS) $(QT_USE_CPPFLAGS)

QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@_lib_CXXFLAGS = \
        $(PLUGIN_BUILD_CXXFLAGS) $(COIN_USE_CXXFLAGS) $(QT_USE_CXXFLAGS)

QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@_lib_CFLAGS = \
        $(PLUGIN_BUILD_CFLAGS) $(COIN_USE_CFLAGS) $(QT_USE_CFLAGS)

libQuarterWidgetPlugin_la_CPPFLAGS = \
        $(PLUGIN_BUILD_CPPFLAGS) $(QUARTER_USE_CPPFLAGS) $(COIN_USE_CPPFLAGS) $(QT_USE_CPPFLAGS)

libQuarterWidgetPlugin_la_lib_CXXFLAGS = \
        $(PLUGIN_BUILD_CXXFLAGS) $(COIN_USE_CXXFLAGS) $(QT_USE_CXXFLAGS)

libQuarterWidgetPlugin_la_lib_CFLAGS = \
        $(PLUGIN_BUILD_CFLAGS) $(COIN_USE_CFLAGS) $(QT_USE_CFLAGS)

libdir = $(QTDIR)/plugins/designer
bindir = $(QTDIR)/plugins/designer

CLEANFILES = \
        $(BuiltSources) \
        QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@.lib \
        QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@.dll \
        QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@.exp \
        QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@.pdb \
        QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@.dll.manifest

QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@.lib: Makefile \
	$(QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@_lib_OBJECTS) \
	$(QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@_lib_DEPENDENCIES)
	@basename="QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@"; \
	rm -f "$$basename.dll" "$$basename.lib"; \
	echo "Linking $$basename.lib..."; \
	echo $(CC) $(LDFLAGS) \
          $(PLUGIN_BUILD_LIBFLAGS) \
	  $(QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@_lib_OBJECTS) \
	  $(QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@_lib_LIBADD) \
          $(QUARTER_USE_LDFLAGS) \
          $(COIN_USE_LDFLAGS) \
          $(QT_USE_LDFLAGS)
	$(CC) $(LDFLAGS) \
          $(PLUGIN_BUILD_LIBFLAGS) \
	  $(QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@_lib_OBJECTS) \
	  $(QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@_lib_LIBADD) \
          $(QUARTER_USE_LDFLAGS) \
          $(COIN_USE_LDFLAGS) \
          $(QT_USE_LDFLAGS)

moc_QuarterWidgetPlugin.cpp: $(srcdir)/QuarterWidgetPlugin.h
	$(MOC) -o $@ $(srcdir)/QuarterWidgetPlugin.h $(DEFAULT_INCLUDES)

if BUILD_WITH_MSVC
all-local: QuarterWidgetPlugin@QUARTER_MAJOR_VERSION@.lib

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
