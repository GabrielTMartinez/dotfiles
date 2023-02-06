#!/usr/bin/env bash
set -e


echo "Installing neovim..."

cd /tmp/

curl -L -O https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb

remoteCheckSum=$(curl -L -o - https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb.sha256sum)
localCheckSum=$(sha256sum nvim-linux64.deb)

if [ "$remoteCheckSum" != "$localCheckSum" ]; then
    echo "Checksums are not equal!"
    exit 1
fi

sudo dpkg -i nvim-linux64.deb

cd -

echo "Installing neovim... Done!"
