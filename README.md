# Dotfiles

Set up a new system, and maintain current configurations. Symlinking to `$HOME` is managed by [Dotbot][dotbot].

```bash
git clone --recurse-submodules git@github.com:rajitbanerjee/dotfiles ~/.dotfiles
cd ~/.dotfiles && ./install
```

```bash
# setup-system-ubuntu
setup-system-mac
setup-coc-nvim
nvim
```

<p align='center'>
  <img src='./assets/images/nvim.png'>
  <img src='./assets/images/floaterm.png'>
</p>

The following resources are not directly used/symlinked:

- `fonts/`: New fonts should be added to the system by the user.
- `notes/`: No tools/scripts, just notes.
- `python/{base.yml,pip*.txt}`: Perform `conda` or `pip` install when required.
- `terminal/`: These settings can be used in the terminal app.
- `vscode/`: Manually provide gist link to VS Code Settings Sync, and install whatever extensions are necessary.

## License

[MIT][license]

[dotbot]: https://github.com/anishathalye/dotbot
[license]: LICENSE
