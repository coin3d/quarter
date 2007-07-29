
if BUILD_HTMLPAGES
HTMLDIR = html
else
HTMLDIR =
endif

SUBDIRS = src include $(HTMLDIR)

pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA= Quarter.pc

EXTRA_DIST = \
	Quarter.pc.in \
	docs/quarter.doxygen.in

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
