#
# .zsh/precmd.d/10_is_gitdir.zsh
#

is_gitdir() {
    git rev-parse --is-inside-work-tree > /dev/null 2>&1 && \
        git branch
}

(( ${precmd_functions[(Ie)is_gitdir]} )) || \
    precmd_functions+=(is_gitdir)
