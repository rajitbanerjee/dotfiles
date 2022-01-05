## Default editor
export EDITOR=nvim

## Language
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

## Add custom scripts + installed scripts to path
export PATH=~/.local/scripts/bin:$PATH
export PATH=~/.local/bin:$PATH

## man
export MANPAGER='nvim +Man!'
export MANWIDTH=999

## Fix SSL verification errors
export SSL_CERT_FILE=/etc/ssl/cert.pem

## nvim sessions (https://github.com/tpope/vim-obsession)
export NVIM_SESSIONS="~/.cache/nvim/"

## Conda
__conda_setup="$(~/.local/share/conda/bin/conda shell."$0" hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f ~/.local/share/conda/etc/profile.d/conda.sh ]; then
        . ~/.local/share/conda/etc/profile.d/conda.sh
    else
        export PATH=~/.local/share/conda/bin:$PATH
    fi
fi
unset __conda_setup

if [ "$(uname -s)" = "Darwin" ]; then
    ## Python (macOS default)
    export PATH=~/Library/Python/3.9/bin:$PATH

    ## command-not-found
    HB_CNF_HANDLER="$(brew --repository)/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
    if [ -f "$HB_CNF_HANDLER" ]; then
        . "$HB_CNF_HANDLER";
    fi

    ## Java
    export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
    export JAVA_11_HOME=$(/usr/libexec/java_home -v11)
    export JAVA_HOME=$JAVA_8_HOME

    ## Julia/FICO Xpress
    export XPRESSDIR="/Applications/FICO\ Xpress/Xpress\ Workbench.app/Contents/Resources/xpressmp"
    . /Applications/FICO\ Xpress/xpressmp/bin/xpvars.sh

elif [ "$(uname -s)" = "Linux" ]; then
    ## Java
    export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
fi
