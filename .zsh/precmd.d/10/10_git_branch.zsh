#
# .zsh/precmd.d/10/10_git_branch.zsh
#

is_gitdir() {
    git rev-parse --is-inside-work-tree > /dev/null 2>&1
}

git_branch() {
    is_gitdir && \
        git branch ${GIT_BRANCH_OPT}
}

(( ${precmd_functions[(Ie)git_branch]} )) || \
    precmd_functions+=(git_branch)
