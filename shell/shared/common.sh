export EDITOR=nvim
export BAT_THEME="gruvbox-dark"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export MANPAGER='nvim +Man!'
export MANWIDTH=999

# Add custom scripts + installed scripts to path
export PATH=~/.local/scripts/bin:$PATH
export PATH=~/.local/bin:$PATH

# NVM
mkdir -p ~/.nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

if [ "$(uname)" = "Darwin" ]; then

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

elif [ "$(uname)" = "Linux" ]; then

	# Linuxbrew
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

	# Java
	export PATH="/usr/lib/jvm/java-11-amazon-corretto.x86_64/bin:$PATH"
	export JAVA_11_AMAZON_CORRETO_HOME="/usr/lib/jvm/java-11-amazon-corretto.x86_64/"
	export JAVA_HOME=$JAVA_11_AMAZON_CORRETO_HOME

fi

