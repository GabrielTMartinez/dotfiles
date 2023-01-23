#!/usr/bin/env bash
set -e


echo "Executing full installation..."

sudo apt -y update
sudo apt -y upgrade
sudo apt -y install snapd
sudo apt -y autoremove

. ./install_files/zsh.sh

. ./install_files/asdf.sh

. ./install_files/vscodium.sh

. ./install_files/alacritty.sh

#. ./install_files/tmux.sh

. ./install_files/exa.sh
. ./install_files/btop.sh
#. ./install_files/bashtop.sh

#. ./install_files/vim.sh
#. ./install_files/vim_plugins.sh

#TODO ncdu duf fd-find batcat? ripgrep

. ./setup_dotfiles.sh
#. ./setup_wsl.sh

echo -e '\nDONT FORGET TO CHANGE YOUR SHELL TO ZSH WITH\nchsh -s $(which zsh)\n'

echo "Executing full installation... Done!"
