#!/usr/bin/env bash
set -e

# install zsh shell
sudo apt -y install zsh
zsh --version

# make zsh the default shell
chsh -s $(which zsh)

# install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
#sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended

# source the aliases from bash
echo 'source $HOME/.bash_aliases' >> $HOME/.zshrc

# fonts that enable some symbols - used for powerlevel10k
sudo apt -y install fonts-powerline

# powerlevel10k
echo ''
echo 'VISIT https://github.com/romkatv/powerlevel10k AND INSTALL THE RECOMMENDED FONT'
echo ''

# install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# set powerlevel10k as the default zsh theme
sed -i 's/plugins=\([a-zA-Z ]*/& theme/' $HOME/.zshrc
zsh -c 'source $HOME/.zshrc'
zsh -c 'theme "powerlevel10k/powerlevel10k"'

# check if file exists
#if [ ! -f ~/.zshrc ]; then
#    echo "File ~/.zshrc DOES NOT exist"
#    echo "Exiting..."
#    exit 1
#fi

# set ZSH_THEME to use powerlevel10k
#sudo sed -i '/# set bell-style none/c\set bell-style none' $bash_inputrc_location

#echo 'Set ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc"

