#
# .zsh/precmd.d/00/00_chg_window_title.zsh
#

chg_window_title() {
    print -Pn "\e]0;[${USER}@${HOST}] %~\a"
}

(( ${precmd_functions[(Ie)chg_window_title]} )) || \
    precmd_functions+=(chg_window_title)
