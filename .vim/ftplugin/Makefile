FTPLGS	= $(wildcard *.vim)

install-ftplugin: $(FTPLGS)
	install -d $(VIM_DOT_DIR)/ftplugin
	install -pm 644 $^ $(VIM_DOT_DIR)/ftplugin

.PHONY: install-ftplugin
