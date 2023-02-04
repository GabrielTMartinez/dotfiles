#!/usr/bin/env bash
set -e


echo "Installing exa..."

sudo apt -y install exa

echo '
# exa
alias cexa="exa -lah"
# /exa
' >> $HOME/.zshrc

echo "Installing exa... Done!"
