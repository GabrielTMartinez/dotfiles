#!/usr/bin/env bash
set -e


echo "Installing docker..."

if [ "$pkgman" = "apt" ]; then
  $install_cmd ca-certificates curl gnupg lsb-release
  sudo mkdir -p /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

elif [ "$pkgman" = "dnf" ]; then
  sudo dnf remove -y docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-selinux docker-engine-selinux docker-engine
  $install_cmd dnf-plugins-core
  sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

elif [ "$pkgman" = "pacman" ]; then
  ''
  #$install_cmd --needed base-devel openssl zlib xz tk
fi

eval ${update_cmd}
if [ "$pkgman" = "zypper" ]; then
  $install_cmd docker docker-compose docker-compose-switch
else
  $install_cmd docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
fi

sudo systemctl enable --now docker

#sudo docker run hello-world

echo "Installing docker... Done!"
