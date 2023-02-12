#!/usr/bin/env bash
set -e


echo "Installing alacritty..."

$install_cmd alacritty

: <<'END'
# INSTALL FROM SOURCE
git clone https://github.com/alacritty/alacritty.git
cd alacritty

sudo apt -y install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3

cargo build --release

echo 'Verifying installation...'
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
infocmp alacritty
echo 'Verifying installation... Done!'

echo 'Installing desktop entries...'
sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database
echo 'Installing desktop entries... Done!'

echo 'Installing manual pages...'
sudo mkdir -p /usr/local/share/man/man1
gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
gzip -c extra/alacritty-msg.man | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null
echo 'Installing manual pages... Done!'

cd ..
END

# INSTALL THEMES
$install_cmd powerline
echo '
# powerline
powerline-daemon -q
test -x /usr/share/powerline/bindings/zsh/powerline.zsh && /usr/share/powerline/bindings/zsh/powerline.zsh
test -x /usr/share/powerline/zsh/powerline.zsh && /usr/share/powerline/zsh/powerline.zsh
# /powerline
' >> $HOME/.zshrc

rm -rf $HOME/.alacritty-colorscheme
git clone https://github.com/eendroroy/alacritty-theme.git $HOME/.alacritty-colorscheme

rm -rf $HOME/.fonts/Hack/
mkdir -p $HOME/.fonts/Hack/
tar -xzvf ./fonts/hack_nerd_font.tar.gz -C $HOME/.fonts/Hack/
fc-cache -f -v
fc-list | grep "Hack"

echo "Installing alacritty... Done!"
