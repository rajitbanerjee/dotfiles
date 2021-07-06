
export PATH=~/Library/Python/3.8/bin:$PATH

# Java 8
export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_HOME=$JAVA_8_HOME

# Toolbox
export PATH=~/.toolbox/bin:$PATH

# AWS CLI completion
complete -C '/usr/local/bin/aws_completer' aws
