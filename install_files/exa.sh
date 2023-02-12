#!/usr/bin/env bash
set -e


echo "Installing exa..."

$install_cmd exa

echo '
# exa
alias cexa="exa -lah"
# /exa
' >> $HOME/.zshrc

echo "Installing exa... Done!"
