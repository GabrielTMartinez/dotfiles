#!/usr/bin/env bash
set -e

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash

source $HOME/.nvm/nvm.sh

nvm install --lts
nvm use --lts

#echo '' | tee -a $HOME/.zshrc > /dev/null
#echo '# NVM' | tee -a $HOME/.zshrc > /dev/null
#echo 'source $HOME/.nvm/nvm.sh' | tee -a $HOME/.zshrc > /dev/null

sed -r -i 's/plugins=\([a-zA-Z ]*/& nvm/' $HOME/.zshrc

echo 'nvm use node > /dev/null' | tee -a $HOME/.bashrc $HOME/.zshrc > /dev/null

