# dotfiles

Minimal, modular Vim, Zsh, GNU Screen, and X11 setup.

## Features

- Vim with dein.vim + ddc.vim
- Per-filetype indent via `.vim/ftplugin`
- Zsh split into `env.zsh`, `alias.zsh`, `env.local.zsh`
- Custom `.screenrc` with status line and keybinds
- Minimal X11 config via `.xinitrc`, `.Xresources`, `.Xmodmap`

## Structure

```sh
.
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
│   └── env.zsh
├── .screenrc
├── .Xresources
├── .Xmodmap
├── .xinitrc
├── LICENSE
└── README.md
```

## Notes

- macOS and Linux supported
- No tmux, no fluff
- X11 session started via .xinitrc (uim + wmaker, long-running stable setup)

## License

These dotfiles are licensed under the Can't Be Bothered License 2025 (CBL).  
See the [LICENSE](https://raw.githubusercontent.com/sasairc2/dotfiles/refs/heads/main/LICENSE) file for details.

## Author

sasairc (https://github.com/sasairc2)
