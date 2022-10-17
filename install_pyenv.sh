#!/usr/bin/env bash
set -e

bashrc="$HOME/.bashrc"
profile="$HOME/.profile"

# install pyenv
brew install pyenv

# pyenv env config
echo '' | tee $bashrc $profile > /dev/null
echo '# pyenv' | tee $bashrc $profile > /dev/null
echo 'export PYENV_ROOT="$HOME/.pyenv"' | tee $bashrc $profile > /dev/null
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' | tee $bashrc $profile > /dev/null
echo 'eval "$(pyenv init -)"' | tee $bashrc $profile > /dev/null

# reload files
source $bashrc
source $profile

