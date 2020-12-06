# Dotfiles [[![Build Status](https://travis-ci.com/rajitbanerjee/dotfiles.svg?branch=master)](https://travis-ci.com/rajitbanerjee/dotfiles)]

My custom configuration files:

- `base.yml`: conda base environment packages
- `bash/`, `bashrc`: bash configurations
- `gitconfig`: username, email, etc.
- `gpg-agent.conf`: GNU privacy guard agent configs
- `./install`: prepare dotfiles with dotbot
- `install.conf.yaml`: config file for dotbot
- `jupyter/`: jupyter notebook configs (+ vim binding)
- `scripts/`: [python/bash scripts][scripts]
- `shell/`: common configs for all types of shells
- `tmux.conf`: tmux configs, borrowed from [anishathalye/dotfiles/tmux.conf][anish]
- `vim/`, `vimrc`: vim configurations, inspired by [amix/vimrc][amix]
- `vscode.txt`: link to VSCode Settings Sync gist

## Installation

Installation on new systems, and symlinking with `$HOME` (for existing systems) managed by the excellent [Dotbot][dotbot].

1. Run the following scripts for setup:

   ```bash
   ./install
   ./scripts/setup-vundle
   ```

<img src='./screenshot.jpg'>

2. Install system dependencies (including the ones necessary for my vim plugins). Root privileges are required.

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
[license]: LICENSE
