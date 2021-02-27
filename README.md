# Dotfiles \[[![Build Status](https://travis-ci.com/rajitbanerjee/dotfiles.svg?branch=master)](https://travis-ci.com/rajitbanerjee/dotfiles)]

My custom configuration files:

-   [base.yml](./base.yml): conda base environment packages
-   [bash/](./bash/), [bashrc](./bashrc): bash configurations
-   [gitconfig](./gitconfig): username, email, etc.
-   [./install](./install): prepare dotfiles with dotbot
-   [install.conf.yml](./install.conf.yml): config file for dotbot
-   [jupyter/](./jupyter/): jupyter notebook configurations 
-   [nvim/](./nvim/): neovim configurations
-   [scripts/][scripts]: python/bash scripts
-   [shell/](./shell/): common configs for all types of shells
-   [tmux.conf](./tmux.conf): tmux configs, borrowed from [anishathalye/dotfiles/tmux.conf][anish]
-   [vim/](./vim/), [vimrc](./vimrc): vim configurations, inspired by [amix/vimrc][amix]
-   [vscode.txt](./vscode.txt): link to VSCode Settings Sync gist
-   [zsh/](./zsh/), [zshrc](./zshrc): zsh configurations; plugins managed by [ohmyzsh][ohmyzsh]

## Installation

Symlinking with `$HOME` (for existing systems) is managed by the excellent [Dotbot][dotbot].

1.  Clone repository and submodules:

    ```bash
    # With SSH
    $ git clone --recurse-submodules git@github.com:rajitbanerjee/dotfiles $HOME/.dotfiles

    # Or, with HTTPS
    $ git clone --recurse-submodules https://github.com/rajitbanerjee/dotfiles.git $HOME/.dotfiles
    ```

2.  Run the following script for setup:

    ```bash
    # Symlink dotfiles
    $ ./install
    ```

> # Alternatively, set up vim plugins
> $ ./scripts/setup-vundle

<img src='./screenshot.jpg'>

3.  Install a range of preferred packages. Root privileges are required.

    ```bash
    $ ./scripts/system-setup
    ```

## License

[MIT][license]

[scripts]: https://github.com/rajitbanerjee/scripts

[amix]: https://github.com/amix/vimrc

[anish]: https://github.com/anishathalye/dotfiles/blob/master/tmux.conf

[dotbot]: https://github.com/anishathalye/dotbot

[ohmyzsh]: https://github.com/ohmyzsh/ohmyzsh

[license]: LICENSE
