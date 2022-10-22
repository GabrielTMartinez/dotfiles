#!/usr/bin/env bash
set -e

bashrc="$HOME/.bashrc"
zshrc="$HOME/.zshrc"
profile="$HOME/.profile"
zprofile="$HOME/.zprofile"

rcs_and_profiles="$bashrc $zshrc $profile $zprofile"

# install pyenv
brew install pyenv

# pyenv env config
echo '' | tee -a $rcs_and_profiles > /dev/null
echo '# pyenv' | tee -a $rcs_and_profiles > /dev/null
echo 'export PYENV_ROOT="$HOME/.pyenv"' | tee -a $rcs_and_profiles > /dev/null
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' | tee -a $rcs_and_profiles > /dev/null
echo 'eval "$(pyenv init -)"' | tee -a $rcs_and_profiles > /dev/null

# reload files
source $bashrc
source $zshrc
source $profile
source $zprofile

# install pyenv dependencies, used for installing python from source
sudo apt install zlib1g-dev

