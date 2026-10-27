#
# .zsh/.zshrc
#

autoload -Uz compinit colors history-search-end

# color
colors
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# history search
bindkey -e
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^P' history-beginning-search-backward-end
bindkey '^N' history-beginning-search-forward-end

# zsh completions
typeset -ga fpath
fpath+=("${ZDOTDIR:-${HOME}/.zsh}/completions")
compinit

# precmd
precmd() {
    for PRECMDS in "${ZDOTDIR}/precmd.d"/*.zsh; do
        test -f "${PRECMDS}" || \
            continue
        source "${PRECMDS}"
    done

    unset PRECMDS
}

() {
    # disable ctrl-S
    stty stop undef

    test -f "${ZDOTDIR}/env.zsh" && \
        source "${ZDOTDIR}/env.zsh"
    test -f "${ZDOTDIR}/env.local.zsh" && \
        source "${ZDOTDIR}/env.local.zsh"
    test -f "${ZDOTDIR}/env.func.zsh" && \
        source "${ZDOTDIR}/env.func.zsh"
    test -f "${ZDOTDIR}/alias.zsh" && \
        source "${ZDOTDIR}/alias.zsh"
    test -f "${ZDOTDIR}/alias.local.zsh" && \
        source "${ZDOTDIR}/alias.local.zsh"
    test -f "${ZDOTDIR}/func.zsh" && \
        source "${ZDOTDIR}/func.zsh"
    test -f "${ZDOTDIR}/motd.zsh" && \
        cat "${ZDOTDIR}/motd.zsh"
}
