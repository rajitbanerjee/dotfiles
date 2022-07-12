# Linuxbrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

## Java
# export JAVA_11_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
export JAVA_11_HOME="$(brew --prefix)/Cellar/openjdk@11/11.0.15/libexec"
export JAVA_HOME=$JAVA_11_HOME

