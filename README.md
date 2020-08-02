# Dotfiles

My custom configuration files:

-   `scripts/`: [python/bash scripts][scripts]
-   `shell/`: common configs for all types of shells
-   `bash/`, `bashrc`: bash configurations
-   `vim/`, `vimrc`: vim configurations, inspired by [amix/vimrc][amix]
-   `gitconfig`: username, email
-   `vscode.txt`, `vscode-server.txt`: list of VSCode extensions
-   `jupyter-lab.txt`: jupyter lab setup info
-   `./install`: prepare dotfiles with dotbot
-   `install.conf.yaml`: config file for dotbot

## Installation

Installation on new systems, and symlinking with `$HOME` (for existing systems) managed by the excellent [Dotbot][dotbot].

Run the following scripts for setup:

```bash
./install
./scripts/setup-vundle
```

## License

[MIT][license]

[scripts]: [https://github.com/rajitbanerjee/scripts]
[amix]: [https://github.com/amix/vimrc]
[dotbot]: [https://github.com/anishathalye/dotbot]
[license]: LICENSE.md
