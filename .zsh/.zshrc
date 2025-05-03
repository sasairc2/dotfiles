#
# .zsh/.zshrc
#

test -f "${ZDOTDIR}/env.local.zsh" && source "${ZDOTDIR}/env.local.zsh"
test -f "${ZDOTDIR}/env.zsh" && source "${ZDOTDIR}/env.zsh"
test -f "${ZDOTDIR}/alias.zsh" && source "${ZDOTDIR}/alias.zsh"

# disable <Ctrl>-S
stty stop undef

bindkey -e
autoload -Uz compinit colors history-search-end
compinit
colors

# prompt
export PROMPT="%{[31m%}%n@%m%{[00m%}%f [ %~ ] %h %# "

# color
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# history search
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^P' history-beginning-search-backward-end
bindkey '^N' history-beginning-search-forward-end

# change terminal window title
precmd() {
    print -Pn "\e]0;[${USER}@${HOST}] %~\a"
}

if [ "${TERM}" = "screen" -o "${TERM}" = "screen-256color" ]; then
    preexec() {
        local cmd="$1"
        local name="${${(s: :)cmd}[1]}"
        print -n "\ek${name}\e\\"
    }
    precmd() {
        print -n "\ekzsh\e\\"
    }
fi
