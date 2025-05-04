# dotfiles

Minimal, modular Vim, Zsh, and GNU Screen setup.

## Features

- Vim with dein.vim + ddc.vim
- Zsh split into `env.zsh`, `alias.zsh`, `env.local.zsh`
- Custom `.screenrc` with status line and keybinds
- Per-filetype indent via `.vim/ftplugin`

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
├── LICENSE
└── README.md
```

## Notes

- macOS & Linux supported
- No tmux, no fluff

## License

These dotfiles are licensed under the Can't Be Bothered License 2025 (CBL).  
See the [LICENSE](https://raw.githubusercontent.com/sasairc2/dotfiles/refs/heads/main/LICENSE) file for details.

## Author

sasairc (https://github.com/sasairc2)
