# Windows Setup

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

## Languages

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
