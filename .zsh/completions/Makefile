COMPS	= $(wildcard _*)

install-zsh-completions:
	install -d $(ZSH_DOT_DIR)/completions
	install -pm 644 $(COMPS) $(ZSH_DOT_DIR)/completions

.PHONY: install-zsh-completions
