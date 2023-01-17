#!/usr/bin/env bash
set -e


echo "Installing btop..."

sudo apt install btop

echo '
# btop
echo 'alias top="btop"'
# /btop
' >> $HOME/.zshrc

echo "Installing btop... Done!"
