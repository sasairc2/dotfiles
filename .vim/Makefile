VIMRCS	= $(wildcard vimrc*)

install: vimdotdir install-vimrc install-ftplugin

vimdotdir:
	install -d $(VIM_DOT_DIR)

install-vimrc: $(VIMRCS)
	install -pm 644 $^ $(VIM_DOT_DIR)

install-ftplugin: ftplugin
	$(MAKE) -C $< $@

.PHONY: install \
	install-vimrc \
	install-ftplugin \
	vimdotdir
