#!/usr/bin/env bash
set -e

# install zsh shell
sudo apt -y install zsh
zsh --version

# make zsh the default shell
chsh -s $(which zsh)

# install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

