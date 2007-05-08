# NOTES:
#   This Makefile.am relies on $(htmldir) being AC_SUBST'ed into place...

if BUILD_HTMLPAGES

# **************************************************************************
# build trickery

$(top_builddir)/docs/quarter.doxygen: $(top_srcdir)/docs/quarter.doxygen.in $(top_builddir)/config.status
	@( cd $(top_builddir); $(MAKE) docs/quarter.doxygen )

index.html: $(top_builddir)/docs/quarter.doxygen
	@( cd ..; \
	echo " $(sim_ac_doxygen_exe) docs/quarter.doxygen"; \
	"$(sim_ac_doxygen_exe)" docs/quarter.doxygen )

filelist.txt: index.html
	@if cmp -s $(top_srcdir)/docs/doxygen/Coin_logo.png Coin_logo.png; then :; else \
	  echo  " cp $(top_srcdir)/docs/doxygen/Coin_logo.png ."; \
	  cp $(top_srcdir)/docs/doxygen/Coin_logo.png .; \
	fi
	@ls -1 | egrep '(\.html|\.png|\.gif|\.css|\.tag)$$' >filelist.txt

all-local: filelist.txt

install-data-local: install-html

uninstall-local: uninstall-html

install-html: filelist.txt
	@$(NORMAL_INSTALL)
	$(mkinstalldirs) $(DESTDIR)$(htmldir)
	@list="`cat filelist.txt`"; \
	for file in $$list; do \
	  echo " $(INSTALL_DATA) $$file $(DESTDIR)$(htmldir)/$$file"; \
	  $(INSTALL_DATA) $$file "$(DESTDIR)$(htmldir)/$$file"; \
	done

uninstall-html: filelist.txt
	@$(NORMAL_UNINSTALL)
	@list="`cat filelist.txt`"; \
	for file in $$list; do \
	  echo " rm -f $(DESTDIR)$(htmldir)/$$file"; \
	  rm -f "$(DESTDIR)$(htmldir)/$$file"; \
	done
	@echo " rmdir $(DESTDIR)$(htmldir)"; \
	rmdir $(DESTDIR)$(htmldir) 2>/dev/null; \
	:
endif
