#!/usr/bin/env bash
set -e

LIGHTCYAN='\033[1;36m'
NC='\033[0m'

echo '-----'
echo -e "${LIGHTCYAN}Installing cli utils...${NC}"
sudo apt install wl-clipboard bat btop duf exa fd-find ripgrep tree zsh git curl alacritty tmux #eza is the new exa - which is the new ls
echo '-----'

echo '-----'
echo -e "${LIGHTCYAN}Copying dotfiles to home...${NC}"
ln -s {$(pwd)/.zshrc,$(pwd)/.tmux.conf} $HOME/
echo '-----'

echo '-----'
echo -e "${LIGHTCYAN}Copying dotfiles to .config...${NC}"
ln -s {$(pwd)/alacritty,$(pwd)/nvim} $HOME/.config/
echo '-----'

echo '-----'
echo -e "${LIGHTCYAN}Installing Hack Nerd Font...${NC}"
mkdir -p $HOME/.local/share/fonts/hack/
rm -rf $HOME/.local/share/fonts/hack/*
tar -xf Hack.tar.xz -C $HOME/.local/share/fonts/hack/
fc-cache -f -v
fc-list | rg "Hack"
echo '-----'

