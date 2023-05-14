#!/usr/bin/env bash
set -e


$install_cmd alacritty neovim tmux powerline

# alacritty themes
rm -rf $HOME/.config/alacritty/themes
mkdir -p $HOME/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme.git $HOME/.config/alacritty/themes

# fonts
rm -rf $HOME/.fonts/Hack/
mkdir -p $HOME/.fonts/Hack/
tar -xzvf ./fonts/hack_nerd_font.tar.gz -C $HOME/.fonts/Hack/
fc-cache -f -v
fc-list | grep "Hack"

# powerlevel10k
rm -rf $HOME/powerlevel10k/
tar -xzvf ./powerlevel10k.tar.gz -C $HOME/
ls $HOME/powerlevel10k/

