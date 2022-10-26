#!/usr/bin/env bash
set -e

nvm use node

vim -c ':CocInstall coc-pyright | qall'
