#!/usr/bin/env bash
set -e


echo "Installing lunarvim..."

echo "Installing python..."
if [ "$pkgman" = "dnf" ]; then
  $install_cmd g++ libstdc++.x86_64 libstdc++-devel.x86_64 libstdc++-static.x86_64 libstdc++-docs.x86_64 libstdc++ gcc-c++-x86_64-linux-gnu.x86_64 gcc
fi

LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.sh)

echo '
# lunarvim
export PATH=/home/gabrieltm/.local/bin:$PATH
# /lunarvim
' >> $HOME/.zshrc

echo "Installing lunarvim... Done!"

