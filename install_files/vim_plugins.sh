#!/usr/bin/env bash
set -e

# coc.nvim
current_dir=$pwd

nvm use node

mkdir -p ~/.vim/pack/coc/start
cd ~/.vim/pack/coc/start
git clone --branch release https://github.com/neoclide/coc.nvim.git --depth=1
vim -c "helptags coc.nvim/doc/ | qall"

cd $current_dir

# gruvbox
$(git clone https://github.com/morhetz/gruvbox.git ~/.vim/pack/default/start/gruvbox)

# Jedi-vim
#$(git clone --recursive https://github.com/davidhalter/jedi-vim.git ~/.vim/pack/jedi/start/jedi-vim)

# pyright
nvm use node
vim -c ':CocInstall coc-pyright | qall'

# vim-airline
$(git clone https://github.com/vim-airline/vim-airline.git ~/.vim/pack/default/start/vim-airline)

