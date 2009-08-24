
if BUILD_HTMLPAGES
HTMLDIR = html
else
HTMLDIR =
endif

if BUILD_LIBRARY
SRCDIRS = src
else
SRCDIRS =
endif

SUBDIRS = include $(HTMLDIR) $(SRCDIRS)

pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA= Quarter.pc

EXTRA_DIST = \
        README.MACOSX \
        README.WIN32 \
        Quarter.pc.in \
        docs/quarter.doxygen.in \
        docs/doxygen/Coin_logo.png \
        cfg/wrapmsvc.exe \
        cfg/errors.txt \
        cfg/doxy4win.pl \
        build/README.txt \
        build/misc/create-directories.bat \
        build/misc/install-headers.bat \
        build/misc/install-sdk.bat \
        build/misc/sync-from-msvc6.sh \
        build/misc/uninstall-headers.bat \
        build/misc/uninstall-sdk.bat \
        build/msvc6/config-debug.h \
        build/msvc6/config-release.h \
        build/msvc6/config.h \
        build/msvc6/quarter1.dsp \
        build/msvc6/quarter1.dsw \
        build/msvc6/quarter1_install.dsp \
        build/msvc6/quarter1_uninstall.dsp \
        build/msvc6/quarterwidgetplugin1.dsp \
        build/msvc7/config-debug.h \
        build/msvc7/config-release.h \
        build/msvc7/config.h \
        build/msvc7/quarter1.sln \
        build/msvc7/quarter1.vcproj \
        build/msvc7/quarter1_install.vcproj \
        build/msvc7/quarter1_uninstall.vcproj \
        build/msvc7/quarterwidgetplugin1.vcproj \
        build/msvc8/config-debug.h \
        build/msvc8/config-release.h \
        build/msvc8/config.h \
        build/msvc8/quarter1.sln \
        build/msvc8/quarter1.vcproj \
        build/msvc8/quarter1_install.vcproj \
        build/msvc8/quarter1_uninstall.vcproj \
        build/msvc8/quarterwidgetplugin1.vcproj \
        build/msvc9/config-debug.h \
        build/msvc9/config-release.h \
        build/msvc9/config.h \
        build/msvc9/quarter1.sln \
        build/msvc9/quarter1.vcproj \
        build/msvc9/quarter1_install.vcproj \
        build/msvc9/quarter1_uninstall.vcproj \
        build/msvc9/quarterwidgetplugin1.vcproj


DISTCLEANFILES = docs/quarter.doxygen

docs/quarter.doxygen: $(srcdir)/docs/quarter.doxygen.in config.status
	@if test -d docs; then :; else mkdir docs; fi
	@./config.status --file=$@:$@.in
	@$(srcdir)/cfg/doxy4win.pl docs/quarter.doxygen

doxygen-doc: built-sources
	if test x"@QUARTER_DOC_HTML@" = x"YES"; then \
	  mkdir -p "@quarter_html_dir@"; \
	else :; fi
	@sim_ac_doxygen_exe@ $(top_builddir)/docs/quarter.doxygen

doxygen-docs: built-sources
	if test x"@QUARTER_DOC_HTML@" = x"YES"; then \
	  mkdir -p "@quarter_html_dir@"; \
	else :; fi
	@sim_ac_doxygen_exe@ $(top_builddir)/docs/quarter.doxygen
