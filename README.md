# Dotfiles

System setup and configuration for macOS and Amazon Linux. Symlinking to `$HOME` is managed by [Dotbot][dotbot].

## Setup

### 1. Clone and install symlinks

```shell
git config --global user.name "Rajit Banerjee"
git config --global user.email "brajit@amazon.com"
mv ~/.gitconfig ~/.gitconfig_local
git clone git@github.com:rajitbanerjee/dotfiles ~/.dotfiles
cd ~/.dotfiles && ./install
git config user.email "rajitbanerjee15@gmail.com"
exec $SHELL -l
```

### 2. Install system packages

```shell
# Amazon Linux
setup-system-al2023  # or setup-system-al2

# macOS
setup-system-mac
install-mac-apps
```

### 3. SSH keys (for GitHub)

```shell
setup-ssh-keys
```

Add the public key at https://github.com/settings/keys.

## Screenshots

![nvim1](./assets/images/nvim1.png)
![nvim2](./assets/images/nvim2.png)
![nvim3](./assets/images/nvim3.png)

## License

[MIT][license]

[dotbot]: https://github.com/anishathalye/dotbot
[license]: LICENSE
