#!/usr/bin/env bash
set -e

profile="$HOME/.profile"
zprofile="$HOME/.zprofile"
profiles="$profile $zprofile"

# install, config and update homebrew
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo '' >> $profiles
echo '# Homebrew' >> $profiles
echo '# Set PATH, MANPATH, etc., for Homebrew.' >> $profiles
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> $profiles

source $profile
source $zprofile

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew update

# brew recommendations
sudo apt -y install build-essential
brew install gcc

