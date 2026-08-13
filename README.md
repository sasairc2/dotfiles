# dotfiles

Minimal, modular Vim, Zsh, GNU Screen, and X11 setup.

## Features

- Vim with dein.vim + ddc.vim
- Per-filetype indent via `.vim/ftplugin`
- Zsh split into `alias.zsh`, `env,zsh`, `env.func.zsh`
- Custom `.screenrc` with status line and keybinds
- fbterm config for TTY (fonts, input)
- Minimal X11 config via `.xinitrc`, `.Xresources`, `.Xmodmap`

## Structure

```sh
.
├── linux
│   └── .config
├── .config
│   └── htop
│       └── htoprc
├── .vim
│   ├── ftplugin
│   │   ├── make.vim
│   │   └── markdown.vim
│   ├── vimrc
│   ├── vimrc.ddc
│   ├── vimrc.dein
│   ├── vimrc.keybind
│   ├── vimrc.local
│   └── vimrc.visual
├── .zsh
│   ├── .zshenv
│   ├── .zshrc
│   ├── alias.zsh
│   ├── completions/
│   ├── env.zsh
│   └── env.func.zsh
├── .fbtermrc
├── .screenrc
├── .xinitrc
├── .Xmodmap
├── .Xresources
├── xinitrc.patch
├── Makefile
├── config.mk
├── LICENSE
└── README.md
```

## Install

```sh
% make install
% make PREFIX=$HOME install
```

default: PREFIX=~/testprefix

see also `Makefile`.

## Notes

- macOS and Linux supported
- No tmux, no fluff
- X11 session started via .xinitrc (uim + wmaker, long-running stable setup)

## License

These dotfiles are licensed under the Can't Be Bothered License 2025 (CBL).  
See the [LICENSE](https://raw.githubusercontent.com/sasairc2/dotfiles/refs/heads/main/LICENSE) file for details.

## Author

sasairc (https://github.com/sasairc2)
