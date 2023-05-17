#!/usr/bin/env bash
set -e


echo "Installing asdf..."

if [ -d "$HOME/.asdf" ]; then
  echo "$HOME/.asdf already exists, skipping asdf installation"
  return 0
fi

$install_cmd curl git

latest_version=$(git ls-remote --refs --tags https://github.com/asdf-vm/asdf.git \
    | cut --delimiter='/' --fields=3     \
    | tr '-' '~'                         \
    | sort --version-sort                \
    | tail --lines=1)

git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch $latest_version

echo "Installing asdf... Done!"


echo "Installing python build-tools..."

if [ "$pkgman" = "apt" ]; then
  $install_cmd git zlib1g-dev libffi-dev libssl-dev libbz2-dev libncursesw5-dev libgdbm-dev liblzma-dev libsqlite3-dev tk-dev uuid-dev libreadline-dev
elif [ "$pkgman" = "dnf" ]; then
  $install_cmd make gcc zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel tk-devel libffi-devel xz-devel libuuid-devel gdbm-devel libnsl2-devel
elif [ "$pkgman" = "pacman" ]; then
  $install_cmd --needed base-devel openssl zlib xz tk
fi

echo "Installing python build-tools... Done!"
