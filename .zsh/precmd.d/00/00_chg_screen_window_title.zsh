#
# .zsh/precmd.d/00/00_chg_screen_window_title.zsh
#

chg_screen_window_title() {
    if [ "${TERM}" = "screen" -o "${TERM}" = "screen-256color" ]; then
        preexec() {
            print -n "\ek$1\e\\"
        }
        precmd() {
            print -n "\ekzsh\e\\"
        }
    fi
}

(( ${precmd_functions[(Ie)chg_screen_window_title]} )) || \
    precmd_functions+=(chg_screen_window_title)
