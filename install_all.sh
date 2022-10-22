#!/usr/bin/env bash
set -e

sudo apt -y update
sudo apt -y upgrade
sudo apt -y autoremove

source ./install_vim.sh
source ./install_colorscheme_vim.sh
# source ./install_jedi_python_vim.sh
source ./install_nvm.sh
source ./install_coc.nvim.sh
source ./install_pyright.sh
source ./setup_dotfiles.sh
source ./install_brew.sh
source ./install_pyenv.sh
source ./install_zsh.sh
source ./install_sdkman.sh
source ./setup_wsl.sh

