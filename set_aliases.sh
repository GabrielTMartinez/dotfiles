#!/usr/bin/env bash
set -e

bash_aliases="$HOME/.bash_aliases"

if [ ! -f $bash_aliases ]; then
    echo "Creating $bash_aliases"
    touch $bash_aliases
else
    echo "$bash_aliases already exists. Exiting..."
    exit 1
fi

echo 'alias gst="git status"' >> $bash_aliases
echo 'alias gpa="git pull --all"' >> $bash_aliases
echo 'alias lah="ls -lah"' >> $bash_aliases
echo 'alias chmodu="chmod -R u=rwx"' >> $bash_aliases

echo ''

