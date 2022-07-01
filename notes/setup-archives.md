# Setup Archives

Tools used in the past, documented in case needed again.

## MacOS

### LaTeX

1.  Installed using `brew install --cask mactex`.
2.  Compile (and format) using `lx file.tex`.
3.  Spell check using `aspell --mode=tex -c file.tex`.
4.  Convert Jupyter Notebook to LaTeX type PDF using `jupyter nbconvert --to pdf file.ipynb`
5.  Pandoc: `brew install pandoc`. Convert Markdown to LaTeX PDF using `mkpdf file.md` (custom function). Specify document style settings at the top of .md file.

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

    ```
    ---
    title: COMPXXXXX Assignment X
    subtitle: XXX
    date: Spring 2022
    author: Rajit Banerjee, 18202817
    geometry: a4paper
    header-includes:
      - \usepackage{fvextra}
      - \DefineVerbatimEnvironment{Highlighting}{Verbatim}{breaklines,commandchars=\\\{\}}
    ---
    ```

6.  Formatter installed separately (since default one was not working): `brew install latexindent`.

### Databases

1. Installation: `brew install postgresql mysql`.
2. Start: `brew services start $SERVICE`.
3. Log in to MySQL: `mysql -u root` (no password).
4. Stop: `brew services stop $SERVICE`.

### R

1. Installation: `brew install r`
2. Run with [RStudio](https://www.rstudio.com/products/rstudio/download/#download).

## Windows

- 21-Jun-2020: Decided to move to WSL2 Ubuntu20.04 completely (except Java/IntelliJ/GUI applications e.g. pygame) for dev.
- Move all code to WSL side instead of `/mnt/c` for massive speed improvements.
- Windows terminal [customisations](./windows_terminal/settings.json).
- [FiraCode NF (nerd font)](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/firacode/regular/complete) needs to be installed and set as fontFace in Windows terminal for vim-devicons.

### Improvements

- [Amethyst (Tiling Window Manager for Windows)](https://github.com/glsorre/amethystwindows)
  - Settings:
    - Padding: 7
    - Start at Login: Enabled
- [WinDynamicDesktop](https://www.microsoft.com/en-ie/p/windynamicdesktop/9nm8n7dq3z5f?cid=storebadge&ocid=badge&rtc=1&activetab=pivot:overviewtab)
- [macOS cursor pack for Windows](https://github.com/antiden/macOS-cursors-for-Windows)
- [PowerToys](https://docs.microsoft.com/en-us/windows/powertoys/)
- [QuickLook](https://www.microsoft.com/en-us/p/quicklook/9nv4bs3l1h4s?activetab=pivot:overviewtab)

### Docker

Docker Desktop on Windows has built-in support for WSL2. [Tips](./docker.md).

### WakaTime (coding metrics)

Added plugin to:

- VSCode (WSL, Windows)
- Vim
- Bash

### C

gcc compiler is preinstalled on UNIX systems.

    $ gcc sample.c -o sample
    $ ./sample

### Java

1.  Write code in IntelliJ (use Gradle for software, and simple `javac` for single files)

        > javac Class_name.java
        > java Class_name

    If the class is in a package:

        > javac package_name/Class_name.java
        > java package_name.Class_name

    Environment variables (Windows):  
    Path `C:\Program Files\Java\jdk1.8.0_281\bin`  
    CLASSPATH `C:\Program Files\Java\jdk1.8.0_281\lib`

2.  WSL2 Installation: Java 11  
    Location: `/usr/bin/java` (provided by /usr/lib/jvm/java-11-openjdk-amd64)

### Python

1.  `~/.local/share/conda/bin/` (WSL)
2.  Create miniconda environments as required.
3.  miniconda has also been installed on Windows (added to Path, use `conda activate base`)
4.  Remember to export environments with `conda env export --no-builds` or custom alias `exp`.
5.  Run `wsl --shutdown` from Command Prompt if WSL2 cannot connect to Jupyter Notebook or other browser processes.

### LaTeX

1.  Installed using `sudo apt-get install texlive texlive-pictures texlive-latex-extra texlive-xetex`.
2.  Compile (and format) using `lx file.tex`.
3.  Spell check using `aspell --mode=tex -c file.tex`.
4.  Convert Jupyter Notebook to LaTeX type PDF using `jupyter nbconvert --to pdf file.ipynb`
5.  Convert Markdown to LaTeX PDF using `pandoc -o file.pdf file.md`. Can specify document style settings at the top of .md file.

### Go

1.  Follow <https://golang.org/doc/install>
2.  GOROOT: Source code installed in `/usr/local/go` (standard as per docs).
3.  GOPATH: `~/.local/go`, where packages are installed.
4.  `go run file.go` or `:GoRun` using vim-go plugin.
