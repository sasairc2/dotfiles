#
# .zsh/alias.zsh
#

alias ..="cd .."
alias v="${EDITOR}"
alias sc="screen"
alias sr="screen -r"
alias ht="headtail --pretty"
alias rl="source ${ZDOTDIR}/.zshrc"
alias zh="history -i -E 1"
alias mbhead="mbhead -p"
alias w3m="w3m https://www.google.co.jp"

if [ "${ZSH_OS}" = "Darwin" ]; then
    alias ls="ls -G"    # color auto (macOS)
else
    alias ls="ls --color=auto"  # color auto (GNU)
fi

# git
alias gh="cd ${GHPROJ}"
alias co="git checkout"
alias b="git branch"
alias c="git commit"
alias p="git push"
alias d="git diff"
alias l="git log --decorate=full --graph --color"
alias m="git merge --no-ff"
alias mf="git submodule foreach git pull origin master"

# cssh
#alias clusterssh="PERL5LIB=\"\" clusterssh"
#alias cssh="PERL5LIB=\"\" cssh"
#alias acssh="PERL5LIB=\"\" cssh ${DENTAKU} ${NUMMERN} ${COMPUTERWELT} ${COMPUTERWELT2} ${AERODYNAMIK} ${ROBOTS} ${COMPUTERLIEBE}"
