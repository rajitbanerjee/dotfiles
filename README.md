# Dotfiles \[[![Build Status](https://travis-ci.com/rajitbanerjee/dotfiles.svg?branch=master)](https://travis-ci.com/rajitbanerjee/dotfiles)]

My custom configuration files:

-   [base.yml](./base.yml): conda base environment packages
-   [bash/](./bash/), [bashrc](./bashrc): bash configurations
-   [gitconfig](./gitconfig): username, email, etc.
-   [./install](./install): prepare dotfiles with dotbot
-   [install.conf.yml](./install.conf.yml): config file for dotbot
-   [jupyter/](./jupyter/): jupyter notebook configs 
-   [scripts/][scripts]: python/bash scripts
-   [shell/](./shell/): common configs for all types of shells
-   [tmux.conf](./tmux.conf): tmux configs, borrowed from [anishathalye/dotfiles/tmux.conf][anish]
-   [vim/](./vim/), [vimrc](./vimrc): vim configurations, inspired by [amix/vimrc][amix]
-   [vscode.txt](./vscode.txt): link to VSCode Settings Sync gist
-   [zsh/](./zsh/), [zshrc](./zshrc): zsh configurations; plugins managed by [ohmyzsh][ohmyzsh]

## Installation

Installation on new systems, and symlinking with `$HOME` (for existing systems) managed by the excellent [Dotbot][dotbot].

1.  Clone repository and submodules:

    ```bash
    git clone --recurse-submodules git@github.com:rajitbanerjee/dotfiles $HOME/.dotfiles
    ```

2.  Run the following scripts for setup:

    ```bash
    ./install
    ./scripts/setup-vundle
    ```

<img src='./screenshot.jpg'>

3.  Install system dependencies (including the ones necessary for vim plugins). Root privileges are required.

    ```bash
    source ./scripts/install-conda
    ./scripts/system-setup
    ```

## License

[MIT][license]

[scripts]: https://github.com/rajitbanerjee/scripts

[amix]: https://github.com/amix/vimrc

[anish]: https://github.com/anishathalye/dotfiles/blob/master/tmux.conf

[dotbot]: https://github.com/anishathalye/dotbot

[ohmyzsh]: https://github.com/ohmyzsh/ohmyzsh

[license]: LICENSE
