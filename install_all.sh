#!/usr/bin/env bash
set -e


command_exists() {
  if ! command -v $1 &> /dev/null; then
    return 1
  fi
  return 0
}

select_package_manager() {
  command_exists 'apt'
  if [ $? -eq 0 ]; then
      echo 'apt found! using it as the package manager!'
      pkgman='apt'
      update_cmd='apt update -y && apt upgrade -y'
      install_cmd='apt install -y'
      autoremove_cmd='apt autoremove -y'
  else
    command_exists 'dnf'
    if [ $? -eq 0 ]; then
      echo 'dnf found! using it as the package manager!'
      pkgman='dnf'
      update_cmd='dnf update -y'
      install_cmd='dnf install -y'
      autoremove_cmd='dnf autoremove -y'
    else
      command_exists 'pacman'
      if [ $? -eq 0 ]; then
        echo 'pacman found! using it as the package manager!'
        pkgman='pacman'
        update_cmd='pacman -Syyu --noconfirm'
        install_cmd='pacman -S --noconfirm'
        autoremove_cmd='pacman -Qdttq | pacman -Rs - --noconfirm'
      fi
    fi
  fi
}

select_package_manager

echo "Executing full installation..."

update_cmd

. ./install_files/zsh.sh

. ./install_files/asdf.sh

#. ./install_files/vscodium.sh

. ./install_files/alacritty.sh

. ./install_files/docker.sh

#. ./install_files/tmux.sh

. ./install_files/exa.sh
. ./install_files/btop.sh
. ./install_files/ripgrep.sh
. ./install_files/duf.sh
. ./install_files/batcat.sh
. ./install_files/tree.sh
#. ./install_files/bashtop.sh

#. ./install_files/vim.sh
#. ./install_files/vim_plugins.sh

#TODO ncdu fd-find

. ./setup_dotfiles.sh
#. ./setup_wsl.sh

. ./install_files/apps.sh

autoremove_cmd

echo -e '\nDONT FORGET TO CHANGE YOUR SHELL TO ZSH WITH\nchsh -s $(which zsh)\n'

echo "Executing full installation... Done!"
