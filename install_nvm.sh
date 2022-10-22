#!/usr/bin/env bash
set -e

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash

source $HOME/.nvm/nvm.sh

nvm install --lts
nvm use --lts

