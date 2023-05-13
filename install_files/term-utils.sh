#!/usr/bin/env bash
set -e

$install_cmd alacritty neovim tmux

# INSTALL THEMES
$install_cmd powerline

rm -rf $HOME/.alacritty-colorscheme
git clone https://github.com/eendroroy/alacritty-theme.git $HOME/.alacritty-colorscheme

rm -rf $HOME/.fonts/Hack/
mkdir -p $HOME/.fonts/Hack/
tar -xzvf ./fonts/hack_nerd_font.tar.gz -C $HOME/.fonts/Hack/
fc-cache -f -v
fc-list | grep "Hack"

