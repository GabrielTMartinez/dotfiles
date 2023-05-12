# Zsh command history
HISTFILE=~/.zsh_cmd_history # Where to save history to disk
HISTSIZE=5000 # How many lines of history to keep in memory
SAVEHIST=5000 # Number of history entries to save to disk

# Zsh opts
setopt nomatch 
setopt appendhistory #Append history to the history file (no overwriting)
setopt sharehistory #Share history across terminals
setopt incappendhistory #Immediately append to the history file, not just when a term is killed
unsetopt autocd beep extendedglob notify

# check key values using: read -r
# check current binds using: bindkey
# generate this file using: autoload zkbd ; zkbd
source /home/lightwanderer/.zkbd/alacritty-:0
bindkey "${key[Home]}" beginning-of-line
bindkey "${key[End]}" end-of-line
bindkey "${key[Delete]}" delete-char
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^H" backward-kill-word
bindkey "^[[3;5~" kill-word
#bindkey -e # What set of key binds to use (vim or emacs)

# aliases
alias gst="git status"
alias gpa="git pull --all"
alias gca="git commit -am"
alias clah="ls -lah"
alias cexa="exa -lah"
alias bat="batcat"

# asdf
. "$HOME/.asdf/asdf.sh"
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)

# Some visual glues like git repo in command line, using zstyle
zstyle :compinstall filename '/home/lightwanderer/.zshrc' 

# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

