#!/usr/bin/env bash
set -e

sudo apt -y install unzip
sudo apt -y install zip
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk version

