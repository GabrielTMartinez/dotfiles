#!/usr/bin/env bash

read -r owner repo <<<$(echo -e "$1" | sed -E 's|.*github\.com[:/]([^/]+)/([^/]+)\.git|\1 \2|')

mkdir -p ~/.config/nvim/pack/$owner/start/$repo
git clone $1 ~/.config/nvim/pack/$owner/start/$repo

