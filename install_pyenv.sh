#!/usr/bin/env bash
set -e

bashrc="$HOME/.bashrc"

# install pyenv
brew install pyenv

# pyenv env config
echo '' >> $bashrc
echo '# pyenv' >> $bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> $bashrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> $bashrc
echo 'eval "$(pyenv init -)"' >> $bashrc

