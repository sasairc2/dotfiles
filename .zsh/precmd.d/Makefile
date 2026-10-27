PRECMDS	= $(wildcard *.zsh)

install-zsh-precmd.d: $(PRECMDS)
	install -d $(ZSH_DOT_DIR)/precmd.d
	install -pm 644 $^ $(ZSH_DOT_DIR)/precmd.d

.PHONY: install-zsh-precmd.d
