#!/usr/bin/env bash
set -e


echo "Installing batcat..."

sudo apt -y install batcat

echo '
# batcat
alias bat="batcat"
# /batcat
' >> $HOME/.zshrc

echo "Installing batcat... Done!"
