#!/usr/bin/env bash
set -e


echo "Installing asdf..."

$install_cmd curl git

latest_version=$(git ls-remote --refs --tags https://github.com/asdf-vm/asdf.git \
    | cut --delimiter='/' --fields=3     \
    | tr '-' '~'                         \
    | sort --version-sort                \
    | tail --lines=1)

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch $latest_version

echo '
# asdf
. "$HOME/.asdf/asdf.sh"
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSHs compinit
autoload -Uz compinit && compinit
# /asdf
' >> $HOME/.zshrc

echo '
# asdf
. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"
# /asdf
' >> $HOME/.bashrc

. "$HOME/.asdf/asdf.sh"

echo "Installing asdf... Done!"


echo "Installing python..."
if [ "$pkgman" = "apt" ]; then
  $install_cmd git zlib1g-dev libffi-dev libssl-dev libbz2-dev libncursesw5-dev libgdbm-dev liblzma-dev libsqlite3-dev tk-dev uuid-dev libreadline-dev
elif [ "$pkgman" = "dnf" ]; then
  $install_cmd make gcc zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel tk-devel libffi-devel xz-devel libuuid-devel gdbm-devel libnsl2-devel
elif [ "$pkgman" = "pacman" ]; then
  $install_cmd --needed base-devel openssl zlib xz tk
fi
asdf plugin add python
asdf install python 3.11.1
asdf global python 3.11.1
echo "Installing python... Done!"

echo "Installing rust..."
asdf plugin add rust
asdf install rust 1.66.0
asdf global rust 1.66.0
echo "Installing rust... Done!"

echo "Installing nodejs..."
asdf plugin add nodejs
asdf install nodejs 18.12.1
asdf global nodejs 18.12.1
echo "Installing nodejs... Done!"

#echo "Installing yarn..."
#asdf plugin add yarn
#asdf install yarn 1.22.19
#asdf global yarn 1.22.19
#echo "Installing yarn... Done!"

echo "Installing java temurin..."
asdf plugin add java
asdf install java temurin-17.0.5+8
asdf global java temurin-17.0.5+8
echo "Installing java temurin... Done!"
