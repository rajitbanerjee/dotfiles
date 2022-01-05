#!/bin/bash
print_help () {
    echo "
Create a new file inside when path to file contains non-existing directories.

Usage:
    $ ./mkfile <non_existing_path/file>
"
}

# Change Internal Field Separator  
IFS='
'
if [[ $* == "" ]]; then
    print_help
    exit 1
fi

mkdir -p "$(dirname "$1")"
touch "$1"
