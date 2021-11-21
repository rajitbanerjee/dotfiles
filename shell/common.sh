## Default editor
export EDITOR=nvim

## Language
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

## Add custom scripts + installed scripts to path
export PATH=~/.local/scripts:$PATH
export PATH=~/.local/bin:$PATH

## man
export MANPAGER='nvim +Man!'
export MANWIDTH=999

## Fix SSL verification errors
export SSL_CERT_FILE=/etc/ssl/cert.pem

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

if [[ "$(uname -s)" == "Darwin" ]]; then
    export PATH=~/Library/Python/3.9/bin:$PATH
    HB_CNF_HANDLER="$(brew --repository)/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
    if [ -f "$HB_CNF_HANDLER" ]; then
        source "$HB_CNF_HANDLER";
    fi

    ## Java
    export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
    export JAVA_11_HOME=$(/usr/libexec/java_home -v11)
    export JAVA_HOME=$JAVA_8_HOME

    ## Julia/FICO Xpress
    export XPRESSDIR="/Applications/FICO\ Xpress/Xpress\ Workbench.app/Contents/Resources/xpressmp"
    source /Applications/FICO\ Xpress/xpressmp/bin/xpvars.sh

    ## Hadoop
    export HADOOP_HOME="/usr/local/Cellar/hadoop/3.3.1/libexec"
    export PATH=$PATH:$HADOOP_HOME/bin
    export PATH=$PATH:$HADOOP_HOME/sbin
    export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
    export HADOOP_MAPRED_HOME=$HADOOP_HOME
    export HADOOP_COMMON_HOME=$HADOOP_HOME
    export HADOOP_HDFS_HOME=$HADOOP_HOME
    export YARN_HOME=$HADOOP_HOME
    export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
    export HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib"
    export HADOOP_CLASSPATH=${JAVA_HOME}/lib/tools.jar

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
fi
