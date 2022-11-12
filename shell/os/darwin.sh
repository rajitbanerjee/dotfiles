# Fix SSL verification errors
export SSL_CERT_FILE=/etc/ssl/cert.pem

# Python
export PATH=~/Library/Python/3.8/bin:$PATH
export PATH=~/Library/Python/3.9/bin:$PATH
eval "$(pyenv init --path)"

# Java
export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_11_HOME=$(/usr/libexec/java_home -v11)
export JAVA_18_HOME=$(/usr/libexec/java_home -v18)
export JAVA_HOME=$JAVA_11_HOME
