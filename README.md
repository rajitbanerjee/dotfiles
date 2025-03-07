# Dotfiles

Set up a new system, and maintain current configurations. Symlinking to `$HOME` is managed by [Dotbot][dotbot].

```shell
git config --global user.name "Rajit Banerjee"
git config --global user.email "brajit@amazon.com"
mv ~/.gitconfig ~/.gitconfig_local
git clone git@github.com:rajitbanerjee/dotfiles ~/.dotfiles
```

```shell
cd ~/.dotfiles && ./install
git config user.email "rajitbanerjee15@gmail.com"
exec $SHELL -l
```

```shell
setup-system-al2
# setup-system-mac
nvim
# install-mac-apps
```

Create a new SSH key for GitHub access:

```shell
ssh-keygen -t ed25519 -C "rajitbanerjee15@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
```

Paste the public key contents in a new SSH key under https://github.com/settings/keys.

## Screenshots

![nvim1](./assets/images/nvim1.png)
![nvim2](./assets/images/nvim2.png)
![nvim3](./assets/images/nvim3.png)

## License

[MIT][license]

[dotbot]: https://github.com/anishathalye/dotbot
[license]: LICENSE
