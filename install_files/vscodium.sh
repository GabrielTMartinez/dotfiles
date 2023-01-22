#!/usr/bin/env bash
set -e


echo "Installing vscodium..."

snap install codium --classic

#wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
#    | gpg --dearmor \
#    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
#
#echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
#    | sudo tee /etc/apt/sources.list.d/vscodium.list
#
#sudo apt -y update && sudo apt -y install codium

echo "Installing vscodium... Done!"