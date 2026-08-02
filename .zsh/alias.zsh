#
# .zsh/alias.zsh
#

set_alias_generic() {
    alias ..="cd .."
    alias v="${EDITOR}"
    alias sc="screen"
    alias sr="screen -r"
    alias rl="source ${ZDOTDIR}/.zshrc"
    alias edit-zmotd="${EDITOR} ${ZDOTDIR}/motd.zsh"
    alias zh="history -i -E 1"
    alias ht="headtail --pretty"
    alias mbhead="mbhead -p"
}

set_alias_for_linux() {
    alias ls="ls --color=auto"
    alias sysctl="systemctl"
    alias jnlctl="journalctl"
    alias xpbcopy="xclip -selection clipboard"
    alias amix="alsamixer"
    alias pmix="pavucontrol"
}

set_alias_for_darwin() {
    alias ls="ls -G"
}

set_alias_git() {
    alias gh="cd ${GHPROJ}"
    alias co="git checkout"
    alias b="git branch"
    alias c="git commit"
    alias ca="git commit --amend"
    alias p="git push"
    alias pl="git pull"
    alias d="git diff"
    alias l="git log --decorate=full --graph --color"
    alias m="git merge --no-ff"
    alias mf="git submodule foreach git pull origin main"
    alias rs="git restore --staged"
}

#set_alias_csh() {
#   alias clusterssh="PERL5LIB=\"\" clusterssh"
#   alias cssh="PERL5LIB=\"\" cssh"
#   alias acssh="PERL5LIB=\"\" cssh ${DENTAKU} ${NUMMERN} ${COMPUTERWELT} ${COMPUTERWELT2} ${AERODYNAMIK} ${ROBOTS} ${COMPUTERLIEBE}"
#}

() {
    set_alias_generic

    if [ "${ZSH_OS}" = "Linux" ]; then
        set_alias_for_linux
    elif [ "${ZSH_OS}" = "Darwin" ]; then
        set_alias_for_darwin
    fi

    which git > /dev/null 2>&1 && \
        set_alias_git
}
