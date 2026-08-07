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
    local ques=0

    case "$1" in
        show)
            zenv_show ;;
        reset)
            if [ "$2" = "path" ]; then
                zenv_path "$1"
            elif [ "$2" = "ld" ]; then
                zenv_ld "$1"
            else
                ques=2
            fi
            ;;
        finalize)
            finalize_env ;;
        *)
            ques=1
    esac

    return ${ques}
}
