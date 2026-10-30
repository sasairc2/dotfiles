#
# .zsh/precmd.d/10/10_git_branch_prompt.zsh
#

is_gitdir() {
    git rev-parse --is-inside-work-tree > /dev/null 2>&1
}

git_branch_prompt() {
    if is_gitdir; then
        PROMPT_EXP[8]="$(git branch --show-current) "
    else
        PROMPT_EXP[8]=""
    fi
}

(( ${precmd_functions[(Ie)git_branch_prompt]} )) || \
    precmd_functions+=(git_branch_prompt)
