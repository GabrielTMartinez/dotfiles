#!/usr/bin/env bash
set -e

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash

zsh -c 'source $HOME/.zshrc'

nvm install --lts
nvm use --lts

