#!/usr/bin/env bash
set -e

sudo apt -y update
sudo apt -y upgrade
sudo apt -y autoremove

all_current_dir=$(pwd)
cd ./install_files
source ./zsh.sh
source ./vim.sh
source ./nvm.sh
source ./vim_plugins.sh
source ./pyenv.sh
source ./sdkman.sh
source ./brew.sh
source ./clojure.sh
cd $all_current_dir

source ./setup_dotfiles.sh
source ./setup_wsl.sh

