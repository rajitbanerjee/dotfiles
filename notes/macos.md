# Mac OS Setup

Current MacOS tools used regularly.

## Tools

- [Notion](https://www.notion.so/product?fredir=1): Notes
- [Bitwarden](https://bitwarden.com): Password manager
- [Mos](https://mos.caldis.me/): Smooth and inverted scrolling for external mice.
  - General Settings
    - [x] Smooth Scrolling
    - [x] Reverse Scroll
    - [x] Launch on Login
    - [x] Hide Status Bar Icon
  - Advanced Settings
    - Step: 10.00
    - Speed: 6.69
    - Duration: 3.90
- Browser:
  - Firefox
    - [AdBlocker Ultimate](https://addons.mozilla.org/en-GB/firefox/addon/adblocker-ultimate/)
    - [uBlock Origin](https://addons.mozilla.org/en-GB/firefox/addon/ublock-origin/)
    - [Bitwarden](https://addons.mozilla.org/en-GB/firefox/addon/bitwarden-password-manager/)
    - [Simple Tab Groups](https://addons.mozilla.org/en-GB/firefox/addon/simple-tab-groups/)
    - `about:config`
      - `layout.css.devPixelsPerPx = 1.9`
  - Safari
    - [Wipr](https://apps.apple.com/us/app/wipr/id1320666476?mt=12)
    - Bitwarden
- Terminal
  - [WezTerm](https://wezfurlong.org/wezterm/index.html)
    - Installed with `brew`, runs on Rosetta 2 by default.
    - Uses `fonts/` and independent colour schemes.
  - [iTerm2](https://iterm2.com)
    - Using Rosetta 2 emulation for Apple Silicon.
    - [Colour schemes](https://github.com/mbadolato/iTerm2-Color-Schemes)
- [Homebrew](https://brew.sh): Package manager
  - Installed using Rosetta 2, hence all packages are in `/usr/local/Cellar/`.
- [Neovim](https://neovim.io): Primary editor
- [VS Code](https://code.visualstudio.com): Secondary editor
- [Docker Desktop](https://www.docker.com/products/docker-desktop): Containers
- For apps installation, see `./bin/install-mac-apps`

## Java

1.  Installed with `brew` in:
    - `/usr/local/Cellar/openjdk@8/`
    - `/usr/local/Cellar/openjdk@11/`
    - `/usr/local/Cellar/openjdk/`
2.  Set `$JAVA_HOME` in `../shell/os/darwin.sh`.
3.  Symlink set to `/Library/Java/JavaVirtualMachines/openjdk-{8,11}.jdk` since `brew` installations are keg-only.
4.  When using nvim and Lombok, set `"java.jdt.ls.vmargs": "-javaagent:/Users/<USERNAME>/.local/lib/lombok.jar"` in `coc-settings.json`.

## NodeJS, TypeScript

1. NodeJS installed with `install-node.now.sh` script.
2. Global prefix for `npm` set to `~/.local/`.
3. `npm install -g typesript ts-node`
4. `npm init` to create a `package.json` template
5. `tsc --init` to create a `tsconfig.json` template
6. `ts-node` to run .ts scripts

## Python

1.  Default macOS installation: `~/Library/Python/3.9/bin/`
2.  `~/.local/share/conda/bin/` (Miniforge3 for Apple Silicon)
3.  Create conda environments as required.
4.  Remember to export environments with `conda env export --no-builds` or custom alias `exp`.
5.  Jupyter: `pip install jupyterlab`. Also need to install and enable nbextensions: `pip install jupyter_contrib_nbextensions && jupyter contrib nbextension uninstall --user`.
