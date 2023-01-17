#!/usr/bin/env bash
set -e


echo "Installing tmux..."

git clone https://github.com/tmux/tmux.git
cd tmux
sh autogen.sh
./configure && make

echo "Installing tmux... Done!"
