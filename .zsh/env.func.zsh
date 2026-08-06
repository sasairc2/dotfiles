#
# .zsh/env.func.zsh
#

zenv_path() {
    case "$1" in
        reset)
            reset_orig_path ;;
        *)
            return 1 ;;
    esac
}

zenv_ld() {
    case "$1" in
        reset)
            reset_orig_ld_lib_path ;;
        *)
            return 1 ;;
    esac
}

zenv_show() {
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

zenv() {
    errno=0

    case "$1" in
        path)
            zenv_path "$2" ;;
        ld)
            zenv_ld "$2" ;;
        show)
            zenv_show ;;
        reset)
            if [ "$2" = "path" ]; then
                reset_orig_path
            elif [ "$2" = "ld" ]; then
                reset_orig_ld_lib_path
            else
                zerrno=1
            fi
            ;;
        finalize)
            finalize_env ;;
        *)
            zerrno=2 ;;
    esac

    return $errno
}
