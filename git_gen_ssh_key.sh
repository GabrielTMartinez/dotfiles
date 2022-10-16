#!/usr/bin/env bash
set -e

ssh-keygen -t ed25519 -C "GabrielTMartinez"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
git remote set-url origin git@github.com:GabrielTMartinez/dotfiles.git

CYAN='\033[0;36m'
NC='\033[0m'
echo "You should visit ${CYAN}https://github.com/settings/keys${NC} and add your ~/.ssh/id_ed25519.pub there"
echo "Visit ${CYAN}https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/githubs-ssh-key-fingerprints${NC} to verify GitHubs ssh fingerprints"

