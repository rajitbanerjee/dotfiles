# Dotfiles \[[![Build Status][travis-badge]][travis]]

Always a WIP!

- Shell
  - [zsh/](./zsh/): zsh configurations; plugins managed by [ohmyzsh][ohmyzsh]
  - [shell/](./shell/): common configurations for all types of shells
  - [ssh/](./ssh/): ssh config
  - [terminal/](./terminal/): terminal emulator settings
  - [tmux/](./tmux/): tmux configurations; `tmux.conf` adapted from [anishathalye/dotfiles/tmux.conf][anish]
- Editor
  - [nvim/](./nvim/): neovim configurations
  - [code/](./code/): list of vscode extensions and link to vscode settings sync gist
  - [fonts/](./fonts/): preferred font files
- General
  - [install.conf.yml](./install.conf.yml), [./install](./install): config and installation for dotbot
  - [bin/](./bin/): python/bash scripts
  - [python/](./python/): conda base environment packages and jupyter notebook configurations
  - [notes/](./notes/): misc. programming/tools setup notes

## Installation

Symlinking to `$HOME` is managed by the excellent [Dotbot][dotbot]. Useful in setting up a new system, or maintaining current dotfiles with version control.

1.  Clone repository and submodules:

    - With SSH:

    ```zsh
    git clone --recurse-submodules git@github.com:rajitbanerjee/dotfiles ~/.dotfiles
    ```

    - With HTTPS:

    ```zsh
    git clone --recurse-submodules https://github.com/rajitbanerjee/dotfiles.git ~/.dotfiles
    ```

2.  Symlink dotfiles:
    ```zsh
    cd ~/.dotfiles && ./install
    ```

<p align='center'>
  <img src='./screenshots/dotbot.png'>
</p>

3.  Set up `~/.gitconfig`:

    ```zsh
    echo "" > ~/.gitconfig && ./bin/gitconfig-global
    ```

4.  Install a range of packages. See [system-setup-mac][ssm], [system-setup-linux][ssl] and [setup-coc-nvim][scn].

    - macOS:

    ```zsh
    ./bin/system-setup-mac
    ```

    - Linux/WSL2:

    ```zsh
    ./bin/system-setup-linux
    ```

    - Set up Neovim and trigger vim-plug installations:

    ```zsh
    nvim
    npm cache verify
    ./bin/setup-coc-nvim
    ```

Neovim:

<p align='center'>
  <img src='./screenshots/nvim.png'>
  <img src='./screenshots/floaterm.png'>
</p>

## License

[MIT][license]

[travis-badge]: https://api.travis-ci.com/rajitbanerjee/dotfiles.svg?branch=main
[travis]: https://travis-ci.com/rajitbanerjee/dotfiles
[anish]: https://github.com/anishathalye/dotfiles/blob/master/tmux.conf
[dotbot]: https://github.com/anishathalye/dotbot
[ohmyzsh]: https://github.com/ohmyzsh/ohmyzsh
[ssm]: https://github.com/rajitbanerjee/dotfiles/blob/main/bin/system-setup-mac
[ssl]: https://github.com/rajitbanerjee/dotfiles/blob/main/bin/system-setup-linux
[scn]: https://github.com/rajitbanerjee/dotfiles/blob/main/bin/setup-coc-nvim
[license]: LICENSE
