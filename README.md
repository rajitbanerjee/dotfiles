# Dotfiles

Set up a new system, and maintain current configurations. Symlinking to `$HOME` is managed by [Dotbot][dotbot].

```bash
git config --global user.name "John Doe"
git config --global user.email "john.doe@gmail.com"
git clone git@github.com:rajitbanerjee/dotfiles ~/.dotfiles
mv ~/.gitconfig ~/.gitconfig_local
rm -rf ~/.bashrc ~/.zshrc
cd ~/.dotfiles && ./install
exec $SHELL -l
```

```bash
# setup-system-al2
# setup-system-ubuntu
setup-system-mac
setup-coc-nvim
nvim

# install-mac-apps
```

![nvim](./assets/images/nvim.png)

### User-Specific Configurations

The following configurations are specific to the user `brajit`, and should be modified if used by others:

- [nvim/coc-settings.json](./config/nvim/coc-settings.json) (`"java.jdt.ls.vmargs": "-javaagent:/home/brajit/.local/lib/lombok.jar"`)
- [vscode/settings.json](./config/vscode/settings.json) (`"remote.SSH.configFile": "/Users/brajit/.ssh/config"`)
- [zshrc](./shell/zshrc) (`alias wp="cd /workplace/brajit"`)
- [ssh/config](./ssh/config) (`Hostname`)

### License

[MIT][license]

[dotbot]: https://github.com/anishathalye/dotbot
[license]: LICENSE
