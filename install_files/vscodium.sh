#!/usr/bin/env bash
set -e


echo "Installing vscodium..."

# INSTALL FROM APT
#wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
#    | gpg --dearmor \
#    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
#
#echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
#    | sudo tee /etc/apt/sources.list.d/vscodium.list
#
#sudo apt -y update && sudo apt -y install codium

# INSTALL FROM SOURCE
sudo apt -y install jq gcc make pkg-config libx11-dev libxkbfile-dev libsecret-1-dev fakeroot rpm dpkg python3 imagemagick

#corepack enable
#corepack prepare yarn@stable --activate

asdf install nodejs 16.19.0

git clone https://github.com/VSCodium/vscodium.git
cd vscodium
asdf local nodejs 16.19.0
./build/build.sh

cd ..

echo "Installing vscodium... Done!"
