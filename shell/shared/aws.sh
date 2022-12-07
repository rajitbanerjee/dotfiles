# Toolbox
export PATH=~/.toolbox/bin:$PATH

# AWS CLI completion
complete -C "$(brew --prefix)/bin/aws_completer" aws

if [[ $(uname -n) == dev-dsk* ]]; then
	# Brazil CLI completion
	source ~/.brazil_completion/zsh_completion

	# AWS profiles
	export AWS_CONFIG_FILE=~/workplace/Federate/src/NodeIsengard/profiles/isengardcli

	export AWS_EC2_METADATA_DISABLED=true
fi
