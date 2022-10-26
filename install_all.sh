#!/usr/bin/env bash
set -e

sudo apt -y update
sudo apt -y upgrade
sudo apt -y autoremove

current_dir=$pwd
cd ./install_files

source ./zsh.sh
source ./vim.sh
source ./colorscheme_vim.sh
# source ./jedi_python_vim.sh
source ./nvm.sh
source ./coc.nvim.sh
# source ./pyright.sh # run in the beggining of a project
source ./setup_dotfiles.sh
source ./brew.sh
source ./pyenv.sh
source ./sdkman.sh
source ./setup_wsl.sh

cd $current_dir

