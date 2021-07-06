
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
