PREFIX		:= ~/testprefix
XDG_CONF_DIR	:= $(PREFIX)/.config
MAKE		:= make
export

all clean:
	@echo "Usage: make install"

install-vimrc: .vim
	cp -r $< $(PREFIX)

install-zshrc: .zsh
	cp -r $< $(PREFIX)
	ln -sf $(PREFIX)/$</.zshenv $(PREFIX)/.zshenv

install-screenrc: .screenrc
	install -pm 644 $< $(PREFIX)

install-htoprc: .config
	make -C $< $@

install: install-vimrc \
	install-zshrc \
	install-screenrc \
	install-htoprc

.PHONY: all \
	clean \
	install \
	install-vimrc \
	install-zshrc \
	install-screenrc \
	install-htoprc
