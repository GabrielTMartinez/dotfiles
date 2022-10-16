#!/usr/bin/env bash
set -e

profile="$HOME/.profile"

# install, config and update homebrew
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo '' >> $profile
echo '# Homebrew' >> $profile
echo '# Set PATH, MANPATH, etc., for Homebrew.' >> $profile
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> $profile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew update

# brew recommendations
sudo apt-get install build-essential
brew install gcc

