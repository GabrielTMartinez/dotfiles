#!/usr/bin/env bash
set -e


echo "Executing full installation..."

sudo apt -y update
sudo apt -y upgrade

. ./install_files/zsh.sh

. ./install_files/asdf.sh

#. ./install_files/vscodium.sh

. ./install_files/alacritty.sh

#. ./install_files/tmux.sh

. ./install_files/exa.sh
. ./install_files/btop.sh
. ./install_files/ripgrep.sh
. ./install_files/duf.sh
#. ./install_files/bashtop.sh

#. ./install_files/vim.sh
#. ./install_files/vim_plugins.sh

#TODO ncdu fd-find batcat?

. ./setup_dotfiles.sh
#. ./setup_wsl.sh

. ./install_files/apps.sh

sudo apt -y autoremove

echo -e '\nDONT FORGET TO CHANGE YOUR SHELL TO ZSH WITH\nchsh -s $(which zsh)\n'

echo "Executing full installation... Done!"
