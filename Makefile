PREFIX		:= ~/testprefix
ZSH_DOT_DIR	:= $(PREFIX)/.zsh
XDG_CONF_DIR	:= $(PREFIX)/.config
MAKE		:= gmake
export

all clean:
	@echo "Usage: make install"

prefix:
	mkdir -p $(PREFIX)

install-vimrc: prefix .vim
	cp -r .vim $(PREFIX)

install-zshrc: prefix .zsh
	make -C .zsh install

install-screenrc: prefix .screenrc
	install -pm 644 .screenrc $(PREFIX)

install-fbtermrc: prefix .fbtermrc
	install -pm 644 .fbtermrc $(PREFIX)

install-htoprc: .config
	$(MAKE) -C $< $@

install-x11: prefix .xinitrc .Xresources .Xmodmap xinitrc.patch
	install -pm 755 .xinitrc $(PREFIX)
	install -pm 644 .Xresources .Xmodmap xinitrc.patch $(PREFIX)

install: install-vimrc \
	install-zshrc \
	install-screenrc \
	install-htoprc

.PHONY: all \
	clean \
	prefix \
	install \
	install-vimrc \
	install-zshrc \
	install-screenrc \
	install-fbtermrc \
	install-htoprc \
	install-x11
