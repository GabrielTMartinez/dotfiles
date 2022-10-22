#!/usr/bin/env bash
set -e

ssh-keygen -t ed25519 -C "GabrielTMartinez"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
git remote set-url origin git@github.com:GabrielTMartinez/dotfiles.git

echo "You should visit https://github.com/settings/keys and add your ~/.ssh/id_ed25519.pub there"
echo "Visit https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/githubs-ssh-key-fingerprints to verify GitHubs ssh fingerprints"

