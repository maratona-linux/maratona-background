prefix=/usr

all:
	:

install: install-wallpaper dconf-config
	@echo You need to manually run "dconf update" as root

install-wallpaper:
	install -d $(DESTDIR)$(prefix)/share/maratona-background/
	install -m 644 maratona-Brasil-testing.png $(DESTDIR)$(prefix)/share/maratona-background/

dconf-config:
	install -d $(DESTDIR)/etc/dconf/db/local.d
	install -m 644 local.d/90-ml-wallpaper $(DESTDIR)/etc/dconf/db/local.d/
	install -m 644 local.d/95-ml-wallpaper-option $(DESTDIR)/etc/dconf/db/local.d/
	install -d $(DESTDIR)/etc/dconf/db/local.d/locks
	install -m 644 local.d/locks/90-wallpaper $(DESTDIR)/etc/dconf/db/local.d/locks/

clean:
	:

dist-clean: clean

uninstall:
	-rm -f $(DESTDIR)/etc/dconf/db/local.d/90-ml-wallpaper
	-rm -f $(DESTDIR)/etc/dconf/db/local.d/95-ml-wallpaper-option
	-rm -f $(DESTDIR)/etc/dconf/db/local.d/locks/90-wallpaper
	-rm -rf $(DESTDIR)$(prefix)/share/maratona-background

.PHONY: install install-wallpaper dconf-config
