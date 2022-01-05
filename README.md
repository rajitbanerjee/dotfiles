# Dotfiles \[[![Build Status][travis-badge]][travis]]

- Shell
  - [zsh/](./zsh/): zsh configurations; plugins managed by [ohmyzsh][ohmyzsh]
  - [shell/](./shell/): common configs for all types of shells
  - [ssh/](./ssh/): ssh config
  - [terminal/](./terminal/): terminal emulator settings
  - [tmux/](./tmux/): tmux configs; `tmux.conf` adapted from [anishathalye/dotfiles/tmux.conf][anish]
- Editor
  - [nvim/](./nvim/): neovim configurations
  - [code/](./code/): list of vscode extensions and link to vscode settings sync gist
  - [fonts/](./fonts/): preferred font files
- Programming
  - [python/](./python/): conda base environment packages and jupyter notebook configurations
  - [bin/](./bin/): python/bash scripts
- Dotbot
  - [install.conf.yml](./install.conf.yml), [./install](./install): config and installation for dotbot

## Installation

Symlinking repository to `~/` is managed by the excellent [Dotbot][dotbot]. Useful in setting up a new system, or maintaining current dotfiles with version control.

1.  Clone repository and submodules:

    ```zsh
    # With SSH
    $ git clone --recurse-submodules git@github.com:rajitbanerjee/dotfiles ~/.dotfiles

    # Alternatively, with HTTPS
    $ git clone --recurse-submodules https://github.com/rajitbanerjee/dotfiles.git ~/.dotfiles
    ```

2.  Run the following for setup:

    ```zsh
    # Remove existing bashrc
    $ rm -rf ~/.bashrc # Linux/WSL2

    # Symlink dotfiles
    $ cd ~/.dotfiles && ./install
    ```

<p align='center'>
  <img src='./screenshots/dotbot.png'>
</p>

3.  Install a range of preferred packages. See [system-setup][ss], [system-setup-mac][ssm] and [setup-coc-nvim][scn].

    ```zsh
    $ ./bin/system-setup-mac    # macOS
    $ ./bin/system-setup-linux  # Linux/WSL2

    # Set up Neovim and trigger vim-plug installations
    $ nvim
    $ npm cache verify
    $ ./bin/setup-coc-nvim
    ```

Neovim:

<p align='center'>
  <img src='./screenshots/nvim.png'>
</p>

## License

[MIT][license]

[travis-badge]: https://api.travis-ci.com/rajitbanerjee/dotfiles.svg?branch=main
[travis]: https://travis-ci.com/rajitbanerjee/dotfiles
[anish]: https://github.com/anishathalye/dotfiles/blob/master/tmux.conf
[dotbot]: https://github.com/anishathalye/dotbot
[ohmyzsh]: https://github.com/ohmyzsh/ohmyzsh
[ss]: https://github.com/rajitbanerjee/dotfiles/blob/main/bin/system-setup
[ssm]: https://github.com/rajitbanerjee/dotfiles/blob/main/bin/system-setup-mac
[scn]: https://github.com/rajitbanerjee/dotfiles/blob/main/bin/setup-coc-nvim
[license]: LICENSE
