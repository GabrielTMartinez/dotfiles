#!/usr/bin/env bash
set -e


sudo apt -y install flatpak
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install -y flathub com.google.Chrome
flatpak install -y flathub com.visualstudio.code

flatpak install -y flathub com.spotify.Client
flatpak install -y flathub com.valvesoftware.Steam
