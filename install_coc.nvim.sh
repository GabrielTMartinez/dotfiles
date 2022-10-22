#!/usr/bin/env bash
set -e

mkdir -p $HOME/.vim/pack/coc/start
cd $HOME/.vim/pack/coc/start
git clone --branch release https://github.com/neoclide/coc.nvim.git --depth=1
vim -c "helptags coc.nvim/doc/ | q"

