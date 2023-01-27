#!/usr/bin/env bash
set -e


echo "Installing zsh..."
sudo apt -y install zsh
zsh --version

echo '
alias gst="git status"
alias gpa="git pull --all"

HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=$HOME/.zsh_history #Where to save history to disk
SAVEHIST=5000               #Number of history entries to save to disk
#HISTDUP=erase               #Erase duplicates in the history file
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed
' >> $HOME/.zshrc
echo "Installing zsh... Done!"
