#!/usr/bin/env bash
set -e


$install_cmd neovim tmux powerline

# build tools
if [ "$pkgman" = "dnf" ]; then
    sudo dnf groupinstall -y "Development Tools" "Development Libraries"
    $install_cmd gcc-c++
fi

# alacritty
if [ "$pkgman" = "apt" ]; then
    $install_cmd cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
elif [ "$pkgman" = "dnf" ]; then
    $install_cmd cmake freetype-devel fontconfig-devel libxcb-devel libxkbcommon-devel g++
elif [ "$pkgman" = "pacman" ]; then
    $install_cmd cmake freetype2 fontconfig pkg-config make libxcb libxkbcommon python
fi

rm -rf /tmp/alacritty
git clone https://github.com/alacritty/alacritty.git /tmp/alacritty
cd /tmp/alacritty
cargo build --release
cd -

# alacritty themes
rm -rf $HOME/.config/alacritty/themes
mkdir -p $HOME/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme.git $HOME/.config/alacritty/themes

# fonts
rm -rf $HOME/.fonts/Hack/
mkdir -p $HOME/.fonts/Hack/
tar -xzvf ./compressed_files/hack_nerd_font.tar.gz -C $HOME/.fonts/Hack/
fc-cache -f -v
fc-list | grep "Hack"

# powerlevel10k
rm -rf $HOME/powerlevel10k/
tar -xzvf ./compressed_files/powerlevel10k.tar.gz -C $HOME/
ls $HOME/powerlevel10k/
