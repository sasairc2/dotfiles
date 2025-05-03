# dotfiles

Minimal, modular Vim, Zsh, and GNU Screen setup.

## Features

- Vim with dein.vim + ddc.vim
- Zsh split into `env.zsh`, `alias.zsh`, `env.local.zsh`
- Custom `.screenrc` with status line and keybinds
- Per-filetype indent via `.vim/ftplugin`

## Structure

```sh
.config
├── htop
│   └── htoprc
.vim
├── ftplugin
│   ├── make.vim
│   └── markdown.vim
├── vimrc
├── vimrc.ddc
├── vimrc.dein
├── vimrc.keybind
├── vimrc.local
└── vimrc.visual
.zsh/
├── .zshenv
├── .zshrc
├── alias.zsh
├── env.zsh
├── completions/
.screenrc

## Notes

- macOS & Linux supported
- No tmux, no fluff

## License

[WTFPL version 2](http://www.wtfpl.net/)

## Author

sasairc (https://github.com/sasairc2)
