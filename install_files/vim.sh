#!/usr/bin/env bash
set -e

current_dir=$(pwd)

default_source_installations_location="$HOME/install_from_source"
vim_github_repo="https://github.com/vim/vim"

# remove other vim versions
sudo apt -y remove vim
# sudo apt -y purge vim

# required tools
sudo apt -y install git
sudo apt -y install make
sudo apt -y install clang
sudo apt -y install libtool-bin
# for python3 support
sudo apt -y install libpython3-dev

# prep dirs and repo
mkdir $default_source_installations_location
cd $default_source_installations_location
git clone $vim_github_repo
cd vim/src
# make distclean

# configs
# ./configure --enable-pythoninterp
./configure --with-features=huge --enable-python3interp

# compile and install
make
sudo make install

cd $current_dir

