#!/usr/bin/env bash
set -e

profile="$HOME/.profile"
zprofile="$HOME/.zprofile"
profiles="$profile $zprofile"

# install, config and update homebrew
NONINTERACTIVE=1 bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo '' | tee -a $profiles > /dev/null
echo '# Homebrew' | tee -a $profiles > /dev/null
echo '# Set PATH, MANPATH, etc., for Homebrew.' | tee -a $profiles > /dev/null
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' | tee -a $profiles > /dev/null

source $profile
source $zprofile

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew update

# brew recommendations
sudo apt -y install build-essential
brew install gcc

