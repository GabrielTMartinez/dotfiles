#!/usr/bin/env bash
set -e

# install zsh shell
sudo apt -y install zsh
zsh --version

# make zsh the default shell
chsh -s $(which zsh)

# install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# fonts that enable some symbols - used for powerlevel10k
sudo apt -y install fonts-powerline

# powerlevel10k
echo ''
echo 'VISIT https://github.com/romkatv/powerlevel10k AND INSTALL THE RECOMMENDED FONT'
echo ''

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo 'Set ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc"
