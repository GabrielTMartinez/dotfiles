#!/usr/bin/env bash
set -e


echo "Installing tmux..."

sudo apt -y install libevent-dev ncurses-dev build-essential bison pkg-config \
	autoconf automake \
	libevent ncurses

git clone https://github.com/tmux/tmux.git
cd tmux
sh autogen.sh
./configure && make

cd ..

echo "Installing tmux... Done!"
