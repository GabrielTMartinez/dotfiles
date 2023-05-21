#!/usr/bin/env bash
set -e

bash_inputrc_location="/etc/inputrc"

# check if file exists
if [ ! -f $bash_inputrc_location ]; then
    echo "File $bash_inputrc_location DOES NOT exist"
    echo "Exiting..."
    exit 1
fi

# disable bash bell
sudo sed -i '/# set bell-style none/c\set bell-style none' $bash_inputrc_location

