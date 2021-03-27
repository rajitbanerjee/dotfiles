## Default editor
export EDITOR=nvim

## Language
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

## Add custom scripts + installed scripts to path
export PATH=~/.local/scripts:$PATH
export PATH=~/.local/bin:$PATH

if [[ "$(uname -s)" == "Darwin" ]]; then
    export PATH=~/Library/Python/3.8/bin:$PATH
	HB_CNF_HANDLER="$(brew --repository)/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
	if [ -f "$HB_CNF_HANDLER" ]; then
		source "$HB_CNF_HANDLER";
	fi
    
    # Java 8
    export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
    export JAVA_HOME=$JAVA_8_HOME

    # Toolbox
    export PATH=~/.toolbox/bin:$PATH

    # AWS CLI completion
    complete -C '/usr/local/bin/aws_completer' aws

elif [[ "$(uname -s)" == "Linux" ]]; then
    ## Bash Wakatime
    if [ -f ~/.local/share/bash-wakatime/bash-wakatime.sh ]; then
        . ~/.local/share/bash-wakatime/bash-wakatime.sh
    fi

    ## Advent of Code session cookie to run personalised input downloader script
    export AOC_COOKIE=53616c7465645f5fa62da8001cdaa78631f07e1961f74c092d770000e1e640f71d139b2c639a2bfac3f195b943683a04

    ## Java 11
    export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"

    ## Go
    export PATH="$PATH:/usr/local/go/bin" # $GOROOT
    export GOPATH=~/.local/go

    # NVM
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi
