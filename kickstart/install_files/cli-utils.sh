#!/usr/bin/env bash
set -e

if [ "$pkgman" = "zypper"  ]; then
  $install_cmd wl-clipboard bat btop duf eza fd ripgrep tree zsh git curl
else
  $install_cmd wl-clipboard bat btop duf eza fd-find ripgrep tree zsh git curl
fi
