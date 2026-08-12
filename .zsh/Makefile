install: zdotdir install-zshrc install-zshenv install-zshrc-alias install-zshrc-env install-zsh-completions link

zdotdir:
	install -d $(ZSH_DOT_DIR)

install-zshrc: .zshrc
	install -pm 644 $< $(ZSH_DOT_DIR)

install-zshenv: .zshenv
	install -pm 644 $< $(ZSH_DOT_DIR)

install-zshrc-alias: alias.zsh
	install -pm 644 $^ $(ZSH_DOT_DIR)

install-zshrc-env: env.zsh env.func.zsh
	install -pm 644 $^ $(ZSH_DOT_DIR)

install-zsh-completions: completions
	$(MAKE) -C ./completions $@

link: install-zshrc-env
	ln -sf $(ZSH_DOT_DIR)/.zshenv $(PREFIX)/.zshenv

.PHONY: install \
	install-zshrc \
	install-zshenv \
	install-zshrc-alias \
	install-zshrc-env \
	install-zsh-completions \
	zdotdir \
	link
