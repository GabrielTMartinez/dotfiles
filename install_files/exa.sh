#!/usr/bin/env bash
set -e


echo "Installing exa..."

sudo apt install exa

echo '
# exa
echo 'alias ls="exa -lah"'
# /exa
' >> $HOME/.zshrc

echo "Installing exa... Done!"
