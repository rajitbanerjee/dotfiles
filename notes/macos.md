# Mac OS Setup

## Tools

- [Notion](https://www.notion.so/product?fredir=1): Notes
- [Bitwarden](https://bitwarden.com): Password manager
- [CleanMyMac X](https://cleanmymac.com): Cleaner
- [UnnaturalScrollWheels](https://github.com/ther0n/UnnaturalScrollWheels): Invert mouse/trackpad scroll direction.
- [Wipr](https://apps.apple.com/us/app/wipr/id1320666476?mt=12): Ad blocker for Safari
- Dev
  - Terminal
    - [iTerm2](https://iterm2.com)
      - Using Rosetta 2 emulation for Apple Silicon.
      - [Colour schemes](https://github.com/mbadolato/iTerm2-Color-Schemes)
    - [FiraCode Nerd Font](https://github.com/rajitbanerjee/dotfiles/tree/main/fonts): Set as Terminal font for vim-devicons to work.
  - [Homebrew](https://brew.sh): Package manager
    - Installed using iTerm2 (Rosetta 2), hence all packages are in `/usr/local/Cellar/`.
  - [Neovim](https://neovim.io): Primary editor
  - [VS Code](https://code.visualstudio.com): Secondary editor
  - [Docker Desktop](https://www.docker.com/products/docker-desktop): Containers

## Languages

### NodeJS, TypeScript

1. NodeJS installed with `install-node.now.sh` script.
2. Global prefix for `npm` set to `~/.local/`.
3. `npm install -g typesript ts-node`
4. `npm init` to create a `package.json` template
5. `tsc --init` to create a `tsconfig.json` template
6. `ts-node` to run .ts scripts

### Python

1.  Default macOS installation: `~/Library/Python/3.9/bin/`
2.  `~/.local/share/conda/bin/` (Miniforge3 for M1 Mac)
3.  Create conda environments as required.
4.  Remember to export environments with `conda env export --no-builds` or custom alias `exp`.
5.  Jupyter: `pip install jupyterlab`. Also need to install and enable nbextensions: `pip install jupyter_contrib_nbextensions && jupyter contrib nbextension uninstall --user`.

### Java

1.  Installed with `brew` in:
    - `/usr/local/Cellar/openjdk@8/1.8.0+312/`
    - `/usr/local/Cellar/openjdk@11/11.0.12/`
2.  Maven installed with `brew` as well, which came with its own java 16 (`/usr/local/Cellar/maven/`, `/usr/local/Cellar/openjdk/16.0.1/`). Setting `JAVA_HOME` to v1.8 forces Maven to use the java 8 installation.
3.  Symlink set to `/Library/Java/JavaVirtualMachines/openjdk-{8,11}.jdk` since `brew` installations for `openjdk@8` and `openjdk@11` are keg-only.

### LaTeX

1.  Installed using `brew install --cask mactex`.
2.  Compile (and format) using `lx file.tex`.
3.  Spell check using `aspell --mode=tex -c file.tex`.
4.  Convert Jupyter Notebook to LaTeX type PDF using `jupyter nbconvert --to pdf file.ipynb`
5.  Pandoc: `brew install pandoc`. Convert Markdown to LaTeX PDF using `mkpdf file.md` (custom function, see `~/.dotfiles`). Specify document style settings at the top of .md file.

    ```
    ---
    title: |
      ![](../assets/ucd.png){height=1in}

      \textbf{COMP00000 Practical X}
    subtitle: Topic of Assignment
    author: Rajit Banerjee, 18202817
    geometry: a4paper, top=0.5in, bottom=0.75in, left=0.75in, right=0.75in
    header-includes:
     - \usepackage{fvextra}
     - \DefineVerbatimEnvironment{Highlighting}{Verbatim}{breaklines,commandchars=\\\{\}}
    output: pdf_document
    ---
    ```

6.  Formatter installed separately (since default one was not working): `brew install latexindent`.

## Julia

1. Installed using `conda install -c conda-forge julia` in env `comp30930`.
2. Other package installations: https://github.com/Pheobe-Sun/Julia-for-optimisation.

## MySQL/PostgreSQL

1. Installation: `brew install mysql postgresql`.
2. Start: `brew services start mysql/postgresql`.
3. Log in to MySQL: `mysql -u root` (no password).
4. Stop: `brew services stop mysql/postgresql`.

# R

1. Installation: `brew install r`
2. Run with [RStudio](https://www.rstudio.com/products/rstudio/download/#download).
