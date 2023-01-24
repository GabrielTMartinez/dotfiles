#!/usr/bin/env bash
set -e


sudo apt -y install flatpak
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "Installing Chrome..."
flatpak install -y flathub com.google.Chrome
echo "Installing Chrome... Done!"

echo "Installing Visual Studio Code..."
flatpak install -y flathub com.visualstudio.code
echo "Installing Visual Studio Code... Done!"

echo "Installing Spotify..."
flatpak install -y flathub com.spotify.Client
echo "Installing Spotify... Done!"

echo "Installing Steam..."
#flatpak install -y flathub com.valvesoftware.Steam
sudo apt -y install steam
echo "Installing Steam... Done!"
