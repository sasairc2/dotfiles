COMPS	= $(wildcard _*)

install-zsh-completions: $(COMPS)
	install -d $(ZSH_DOT_DIR)/completions
	install -pm 644 $^ $(ZSH_DOT_DIR)/completions

.PHONY: install-zsh-completions
