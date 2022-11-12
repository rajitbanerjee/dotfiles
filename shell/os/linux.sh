# Linuxbrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Java
export PATH="$(brew --prefix)/Cellar/openjdk@11/11.0.16.1_1/bin:$PATH"
export JAVA_11_HOME="$(brew --prefix)/Cellar/openjdk@11/11.0.16.1_1/libexec"
export JAVA_HOME=$JAVA_11_HOME
