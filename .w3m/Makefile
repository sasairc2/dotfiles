include ../config.mk

install: install-w3m-keymap

install-w3m-keymap: keymap
	install -d $(W3M_DOT_DIR)
	install -pm 644 $< $(W3M_DOT_DIR)

.PHONY: install install-w3m-keymap
