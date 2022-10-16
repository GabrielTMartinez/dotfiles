#!/usr/bin/env bash
set -e

default_source_installations_location="$HOME/install_from_source"
vim_github_repo="https://github.com/vim/vim"

# required tools
sudo apt -y install git
sudo apt -y install make
sudo apt -y install clang
sudo apt -y install libtool-bin

# prep dirs and repo
mkdir $default_source_installations_location
cd $default_source_installations_location
git clone $vim_github_repo
cd vim/src

# configs
# ./configure --enable-pythoninterp
./configure --with-features=huge --enable-python3interp

# compile and install
# make distclean
make
sudo make install

