#!/usr/bin/env bash

ssh-keygen -t ed25519 -C "GabrielTMartinez"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

echo "You should visit https://github.com/settings/keys and add your ~/.ssh/id_ed25519.pub there"
