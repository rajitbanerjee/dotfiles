## Default editor
export EDITOR=vim

## Add custom python/bash scripts to path
export PATH=~/.local/scripts:"$PATH"

## Set for Ack/Perl
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

## Bash Wakatime
if [ -f ~/.local/share/bash-wakatime/bash-wakatime.sh ]; then
    . ~/.local/share/bash-wakatime/bash-wakatime.sh
fi

## Advent of Code session cookie to run personalised input downloader script
export AOC_COOKIE=53616c7465645f5fbba5b645d9d8d3aa2250aac1f76dffc5e564854d6c22b37cd339edcb5b9ceb04675e8b51be0e5a39

## Java 11
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"

## Go
export PATH="$PATH:/usr/local/go/bin" # $GOROOT
export GOPATH="$HOME/.local/go"
