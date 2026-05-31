PREFIX		:= ~/testprefix
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
	cp -r .zsh $(PREFIX)
	ln -sf $(PREFIX)/.zsh/.zshenv $(PREFIX)/.zshenv

install-screenrc: prefix .screenrc
	install -pm 644 .screenrc $(PREFIX)

install-fbtermrc: prefix .fbtermrc
	install -pm 644 .fbtermrc $(PREFIX)

install-htoprc: .config
	$(MAKE) -C $< $@

install-x11: prefix
	install -pm 755 .xinitrc .xsession $(PREFIX)
	install -pm 644 .Xresources .Xmodmap $(PREFIX)

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
