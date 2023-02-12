#!/usr/bin/env bash
set -e


echo "Installing lunarvim..."

LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.sh)

echo '
# lunarvim
export PATH=/home/gabrieltm/.local/bin:$PATH
# /lunarvim
' >> $HOME/.zshrc

echo "Installing lunarvim... Done!"
