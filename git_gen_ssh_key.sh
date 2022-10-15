#!/usr/bin/env bash

ssh-keygen -t ed25519 -C "GabrielTMartinez"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

