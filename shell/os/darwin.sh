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
