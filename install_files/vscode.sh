#!/usr/bin/env bash
set -e


echo "Installing vscode..."

$install_cmd code

: <<'END'
cd /tmp/

curl -L -o ./vscode.rpm "https://code.visualstudio.com/sha/download?build=stable&os=linux-rpm-x64"

sudo dnf install -y ./vscode.rpm

cd -
END

echo "Installing vscode... Done!"
