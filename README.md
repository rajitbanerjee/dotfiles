# Dotfiles

Set up a new system, and maintain current configurations. Symlinking to `$HOME` is managed by [Dotbot][dotbot].

```bash
git config --global user.name "Rajit Banerjee"
git config --global user.email "rajitbanerjee15@gmail.com"
git clone git@github.com:rajitbanerjee/dotfiles ~/.dotfiles
mv ~/.gitconfig ~/.gitconfig_local
rm -rf ~/.bashrc ~/.zshrc
cd ~/.dotfiles && ./install
exec $SHELL -l
```

```bash
# setup-system-al2, setup-system-ubuntu
setup-system-mac
setup-coc-nvim
nvim

# install-mac-apps
```

![nvim](./assets/images/nvim.png)

## License

[MIT][license]

[dotbot]: https://github.com/anishathalye/dotbot
[license]: LICENSE
