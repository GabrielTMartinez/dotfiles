#!/usr/bin/env bash
set -e


$install_cmd flatpak
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "Installing Chrome..."
$install_cmd google-chrome-stable
#flatpak install -y flathub com.google.Chrome
echo "Installing Chrome... Done!"

echo "Installing Visual Studio Code..."
#flatpak install -y flathub com.visualstudio.code
echo "Installing Visual Studio Code... Done!"

echo "Installing Spotify..."
flatpak install -y flathub com.spotify.Client
echo "Installing Spotify... Done!"

echo "Installing Steam..."
$install_cmd steam
#flatpak install -y flathub com.valvesoftware.Steam
#flatpak override --user --filesystem=/media/GabrielTMartinez/hdd com.valvesoftware.Steam
echo "Installing Steam... Done!"
