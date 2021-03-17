## Default editor
export EDITOR=nvim

## Add custom scripts + installed scripts to path
export PATH="$HOME/.local/scripts:$PATH"
export PATH="$HOME/.local/bin:$PATH"

## Language
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

if [ "$(uname -s)" == "Linux" ]; then 
    ## Bash Wakatime
    if [ -f "$HOME/.local/share/bash-wakatime/bash-wakatime.sh" ]; then
        . "$HOME/.local/share/bash-wakatime/bash-wakatime.sh"
    fi

    ## Advent of Code session cookie to run personalised input downloader script
    export AOC_COOKIE=53616c7465645f5fa62da8001cdaa78631f07e1961f74c092d770000e1e640f71d139b2c639a2bfac3f195b943683a04

    ## Java 11
    export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"

    ## Go
    export PATH="$PATH:/usr/local/go/bin" # $GOROOT
    export GOPATH="$HOME/.local/go"

    # NVM
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi
