#!/usr/bin/env bash
set -e

# coc.nvim
nvm use node

mkdir -p ~/.vim/pack/coc/start
git clone --branch release https://github.com/neoclide/coc.nvim.git --depth=1 ~/.vim/pack/coc/start/coc.nvim
vim -c "helptags ~/.vim/pack/coc/start/coc.nvim/doc/ | qall"

# gruvbox
$(git clone https://github.com/morhetz/gruvbox.git ~/.vim/pack/default/start/gruvbox)

# Jedi-vim
#$(git clone --recursive https://github.com/davidhalter/jedi-vim.git ~/.vim/pack/jedi/start/jedi-vim)

# pyright
nvm use node
vim -c ':CocInstall -sync coc-pyright | qall'

# vim-airline
$(git clone https://github.com/vim-airline/vim-airline.git ~/.vim/pack/default/start/vim-airline)

# ale
mkdir -p ~/.vim/pack/git-plugins/start
git clone --depth 1 https://github.com/dense-analysis/ale.git ~/.vim/pack/git-plugins/start/ale

