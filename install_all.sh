#!/usr/bin/env bash
set -e

sudo apt -y update
sudo apt -y upgrade
sudo apt -y autoremove

current_dir=$pwd
cd ./install_files
source ./zsh.sh
source ./vim.sh
source ./nvm.sh
source ./vim_plugins.sh
source ./brew.sh
source ./pyenv.sh
source ./sdkman.sh
cd $current_dir

source ./setup_dotfiles.sh
source ./setup_wsl.sh

