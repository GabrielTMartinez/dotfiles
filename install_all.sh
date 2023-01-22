#!/usr/bin/env bash
set -e


echo "Executing full installation..."

sudo apt -y update
sudo apt -y upgrade
sudo apt -y autoremove

source ./install_files/zsh.sh

source ./install_files/asdf.sh

source ./install_files/vscodium.sh

source ./install_files/alacritty.sh

#source ./install_files/tmux.sh

source ./install_files/exa.sh
source ./install_files/btop.sh
#source ./install_files/bashtop.sh

#source ./install_files/vim.sh
#source ./install_files/vim_plugins.sh

#TODO ncdu duf fd-find batcat? ripgrep

#source ./setup_dotfiles.sh
#source ./setup_wsl.sh

echo -e '\nDONT FORGET TO CHANGE YOUR SHELL TO ZSH WITH\nchsh -s $(which zsh)\n'

echo "Executing full installation... Done!"
