#!/usr/bin/env bash
set -e

bash_inputrc_location="/etc/inputrc"
vimrc_location="$HOME/.vimrc"

# check if file exists
if [ ! -f $bash_inputrc_location ] || [ -f $vimrc_location ]; then
    echo "File $bash_inputrc_location DOES NOT exist"
    echo "OR"
    echo "File $vimrc_location DOES exist"
    echo "Exiting..."
    exit 1
fi

# disable bash bell
sudo sed -i '/# set bell-style none/c\set bell-style none' $bash_inputrc_location

# disable vim bell
echo "set visualbell" >> $vimrc_location
echo "set t_vb=" >> $vimrc_location

# enable line number in vim
echo "set number" >> $vimrc_location

