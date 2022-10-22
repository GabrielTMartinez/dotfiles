#!/usr/bin/env bash
set -e

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash

source $HOME/.nvm/nvm.sh

nvm install --lts
nvm use --lts

echo 'nvm use node' >> $HOME/.bashrc
echo 'nvm use node' >> $HOME/.zshrc

