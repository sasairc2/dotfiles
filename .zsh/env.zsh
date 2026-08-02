#
# .zsh/env.zsh
#

# sysinfo
set_os_arch() {
    export ZSH_OS="$(uname -s)"
    export ZSH_ARCH="$(uname -m)"
}

# backup original PATH
set_orig_path() {
    test -z "${ZSH_ORIGINAL_PATH}" && \
        export ZSH_ORIGINAL_PATH="${PATH}"
}

# restore original PATH
reset_orig_path() {
    export PATH="${ZSH_ORIGINAL_PATH}"
}

use_generic_env() {
    # disable screen lock
    export LOCKPRG="/bin/true"
 
    # prompt
    export PROMPT="%{[31m%}%n@%m%{[00m%}%f [ %~ ] %h %# "

    # misc
    export EDITOR="vim"
    export VISUAL="${EDITOR}"
    export PAGER="less"

    # history
    export HISTFILE="${ZDOTDIR}/zsh_history"
    export HISTSIZE=100000
    export SAVEHIST=100000
    export LESSHISTFILE=-
    export LESSCHARSET="UTF-8"
    setopt HIST_IGNORE_DUPS
    setopt HIST_IGNORE_ALL_DUPS
    setopt HIST_IGNORE_SPACE
    setopt HIST_SAVE_NO_DUPS
    setopt HIST_FIND_NO_DUPS
    setopt HIST_REDUCE_BLANKS
    setopt HIST_NO_STORE
    setopt PUSHD_IGNORE_DUPS

    # locale
    export LANG="ja_JP.UTF-8"
    #export LC_ALL="ja_JP.UTF-8"
    setopt PRINT_EIGHT_BIT
}

# prefix local
#
# INCLUDE is used by some legacy build tools, not by most modern toolchains
#
use_prefix_local() {
    export PREFIX_LOCAL="${HOME}/local"
    export PATH="${PREFIX_LOCAL}/bin${PATH:+:$PATH}"
    export MANPATH="${PREFIX_LOCAL}/share/man${MANPATH:+:$MANPATH}"
    export PKG_CONFIG_PATH="${PREFIX_LOCAL}/lib/pkgconfig${PKG_CONFIG_PATH:+:$PKG_CONFIG_PATH}"
    export INCLUDE="-I${PREFIX_LOCAL}/include${INCLUDE:+ $INCLUDE}"
    export CPPFLAGS="-I${PREFIX_LOCAL}/include${CPPFLAGS:+ $CPPFLAGS}"
    export LDFLAGS="-L${PREFIX_LOCAL}/lib${LDFLAGS:+ $LDFLAGS}"

    if [ "${ZSH_OS}" = "Darwin" ]; then
        export DYLD_LIBRARY_PATH="${PREFIX_LOCAL}/lib${DYLD_LIBRARY_PATH:+:$DYLD_LIBRARY_PATH}"
    else
        export LD_LIBRARY_PATH="${PREFIX_LOCAL}/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
        #export LD_RUN_PATH="${LD_LIBRARY_PATH}"
        #export RPATH="${LD_LIBRARY_PATH}"
    fi
}

# deno
use_deno()
{
    source "${HOME}/.deno/env"
}

# homebrew
use_homebrew() {
    export HOMEBREW_PREFIX="/opt/homebrew"
    export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
    export HOMEBREW_REPOSITORY="/opt/homebrew"
    export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH:+:$PATH}"
    export MANPATH="/opt/homebrew/share/man${MANPATH:+:$MANPATH}"
    export INFOPATH="/opt/homebrew/share/info${INFOPATH:+:$INFOPATH}"
    export PKG_CONFIG_PATH="/opt/homebrew/lib/pkgconfig:/opt/homebrew/share/pkgconfig${PKG_CONFIG_PATH:+:$PKG_CONFIG_PATH}"
    export CPPFLAGS="-I/opt/homebrew/include ${CPPFLAGS:+ $CPPFLAGS}"
    export LDFLAGS="-L/opt/homebrew/lib ${LDFLAGS:+ $LDFLAGS}"
}

# nodebrew
use_nodebrew() {
    export PATH="${HOME}/.nodebrew/current/bin${PATH:+:$PATH}"
}

# XDG base directory specification
use_xdg() {
    export XDG_CONFIG_HOME="${HOME}/.config"
    export XDG_CACHE_HOME="${HOME}/.cache"
    export XDG_DATA_HOME="${HOME}/.local/share"
}

# clangsay
use_clangsay () {
    export COWPATH="${PREFIX_LOCAL}/share/clangsay/cows:${GHPROJ}/my_cows"
    export DEFAULT_COWFILE="yasuna_09"
}

# compiler flags (apple silicon)
compiler_flags_for_darwin() {
    export CFLAGS="-march=native -mtune=native -Wall -Wextra -O3 -pipe"
    export CXXFLAGS="${CFLAGS}"
}

# compiler flags (universal binary)
compiler_flags_for_darwin_universal() {
    export CFLAGS="-arch x86_64 -arch arm64"
    export CXXFLAGS="${CFLAGS}"
    export LDFLAGS="-arch x86_64 -arch arm64 ${LDFLAGS:+ $LDFLAGS}"
}

# compiler flags (linux)
compiler_flags_for_linux() {
    export CFLAGS="-march=native -mtune=native -Wall -Wextra -O3 -pipe"
    export CXXFLAGS="${CFLAGS}"
}

compiler_flags_for_linux_x86_64() {
    export CFLAGS="-march=native -mtune=native -Wall -Wextra -O3 -pipe"
    export CXXFLAGS="${CFLAGS}"
}

compiler_flags_for_linux_aarch64 () {
    # ARM v8 Cortex-A53 processor
    export CFLAGS="-Wall -O3 -mcpu=cortex-a53 -march=armv8-a+crc -mtune=cortex-a53 -mfloat-abi=hard -mfpu=neon-fp-armv8 -fforce-addr -pipe"
    export CXXFLAGS="${CFLAGS}"
}

# show envs
show_envs() {
    cat <<EOF
ZSH_OS=${ZSH_OS}
ZSH_ARCH=${ZSH_ARCH}
PATH=${PATH}
PKG_CONFIG_PATH=${PKG_CONFIG_PATH}
CFLAGS=${CFLAGS}
CXXFLAGS=${CXXFLAGS}
CPPFLAGS=${CPPFLAGS}
LDFLAGS=${LDFLAGS}
EOF
    if [ "${ZSH_OS}" = "Darwin" ]; then
        echo "DYLD_LIBRARY_PATH=${DYLD_LIBRARY_PATH}"
    else
        echo "LD_LIBRARY_PATH=${LD_LIBRARY_PATH}"
    fi
}

# path deduplication
#finalize_env() {
#    typeset -U PATH MANPATH INFOPATH PKG_CONFIG_PATH CPPFLAGS LDFLAGS
#}

() {
    set_os_arch
    set_orig_path
    reset_orig_path
    use_generic_env
    use_xdg

    test -d "${HOME}/.deno" && \
        use_deno

    test -d "${HOME}/.nodebrew" && \
        use_nodebrew

    test -d "${HOME}/local" && \
        use_prefix_local

    which clangsay > /dev/null 2>&1 && \
        use_clangsay

    if [ "${ZSH_OS}" = "Linux" ]; then
        case "${ZSH_ARCH}" in
            aarch64)
                compiler_flags_for_linux_aarch64 ;;
            x86_64)
                compiler_flags_for_linux_x86_64 ;;
            *)
                compiler_flags_for_linux ;;
        esac
    elif [ "${ZSH_OS}" = "Darwin" ]; then
        use_homebrew
        compiler_flags_for_darwin
    fi
}
