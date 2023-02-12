#!/usr/bin/env bash
set -e


command_exists() {
  if ! command -v $1 &> /dev/null; then
    cmd_exists=0
  else
    cmd_exists=1
  fi
}

select_package_manager() {
  command_exists 'apt'
  if [ $cmd_exists -eq 1 ]; then
      echo 'apt found! using it as the package manager!'
      pkgman='apt'
      update_cmd='sudo apt -y update; sudo apt -y upgrade'
      install_cmd='sudo apt -y install'
      autoremove_cmd='sudo apt -y autoremove'
  else
    command_exists 'dnf'
    if [ $cmd_exists -eq 1 ]; then
      echo 'dnf found! using it as the package manager!'
      pkgman='dnf'
      update_cmd='sudo dnf update -y'
      install_cmd='sudo dnf install -y'
      autoremove_cmd='sudo dnf autoremove -y'
    else
      command_exists 'pacman'
      if [ $cmd_exists -eq 1 ]; then
        echo 'pacman found! using it as the package manager!'
        pkgman='pacman'
        update_cmd='sudo pacman -Syyu --noconfirm'
        install_cmd='sudo pacman -S --noconfirm'
        autoremove_cmd='sudo pacman -Qdttq | pacman -Rs - --noconfirm'
      fi
    fi
  fi
}

select_package_manager

echo "Executing full installation..."

eval ${update_cmd}

. ./install_files/zsh.sh

. ./install_files/alacritty.sh
. ./install_files/tmux.sh

. ./install_files/asdf.sh

#. ./install_files/vscode.sh
#. ./install_files/vscodium.sh

. ./install_files/docker.sh

. ./install_files/exa.sh
. ./install_files/btop.sh
. ./install_files/ripgrep.sh
. ./install_files/duf.sh
. ./install_files/bat.sh
. ./install_files/tree.sh
#. ./install_files/bashtop.sh

. ./install_files/neovim.sh
#. ./install_files/vim.sh
#. ./install_files/vim_plugins.sh

#TODO ncdu fd-find

. ./setup_dotfiles.sh
#. ./setup_wsl.sh

. ./install_files/apps.sh

$autoremove_cmd

echo -e '\nDONT FORGET TO CHANGE YOUR SHELL TO ZSH WITH\nchsh -s $(which zsh)\n'

echo "Executing full installation... Done!"
