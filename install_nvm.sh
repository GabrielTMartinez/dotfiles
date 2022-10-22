#!/usr/bin/env bash
set -e

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | zsh

source $HOME/.nvm/nvm.sh

nvm install --lts
nvm use --lts

#echo '' | tee -a $HOME/.bashrc $HOME/.zshrc > /dev/null
#echo '# NVM' | tee -a $HOME/.bashrc $HOME/.zshrc > /dev/null
#echo 'export NVM_DIR="$HOME/.nvm"' | tee -a $HOME/.bashrc $HOME/.zshrc > /dev/null
#echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm' | tee -a $HOME/.bashrc $HOME/.zshrc > /dev/null
#echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion' | tee -a $HOME/.bashrc $HOME/.zshrc > /dev/null
echo 'nvm use node > /dev/null' | tee -a $HOME/.bashrc $HOME/.zshrc > /dev/null

