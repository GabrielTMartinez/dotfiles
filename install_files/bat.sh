#!/usr/bin/env bash
set -e


echo "Installing bat..."

$install_cmd bat

echo '
# bat
alias bat="batcat"
# /bat
' >> $HOME/.zshrc

echo "Installing bat... Done!"
