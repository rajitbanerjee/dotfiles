## Default editor
export EDITOR=nvim

## Language
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

## Add custom scripts + installed scripts to path
export PATH=~/.local/scripts:$PATH
export PATH=~/.local/bin:$PATH

# man
export MANPAGER='nvim +Man!'
export MANWIDTH=999

if [[ "$(uname -s)" == "Darwin" ]]; then
    export PATH=~/Library/Python/3.9/bin:$PATH
    HB_CNF_HANDLER="$(brew --repository)/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
    if [ -f "$HB_CNF_HANDLER" ]; then
        source "$HB_CNF_HANDLER";
    fi

    # Java 8
    export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
    export JAVA_HOME=$JAVA_8_HOME
elif [[ "$(uname -s)" == "Linux" ]]; then

    ## Java 11
    export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"

    ## Go
    export PATH="$PATH:/usr/local/go/bin" # $GOROOT
    export GOPATH=~/.local/go

    # NVM
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

    ## Conda setup
    __conda_setup="$(~/.local/share/conda/bin/conda shell.$0 hook 2> /dev/null)"
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

fi
