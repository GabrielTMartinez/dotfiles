# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Zsh command history
HISTFILE=~/.zsh_cmd_history # Where to save history to disk
HISTSIZE=5000 # How many lines of history to keep in memory
SAVEHIST=5000 # Number of history entries to save to disk

# Zsh opts
setopt appendhistory #Append history to the history file (no overwriting)
setopt sharehistory #Share history across terminals
setopt incappendhistory #Immediately append to the history file, not just when a term is killed
setopt nomatch 
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
#alias bat="batcat"

# powerlevel10k
source ~/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# powerline
#powerline-daemon -q
#test -x /usr/share/powerline/bindings/zsh/powerline.zsh && /usr/share/powerline/bindings/zsh/powerline.zsh
#test -x /usr/share/powerline/zsh/powerline.zsh && /usr/share/powerline/zsh/powerline.zsh

# asdf
. "$HOME/.asdf/asdf.sh"
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)

# auto activate python venv on cd
function cd() {
  builtin cd "$@"

  if [[ -z "$VIRTUAL_ENV" ]] ; then
    ## If env folder is found then activate the vitualenv
      if [[ -d ./venv ]] ; then
        source ./venv/bin/activate
      fi
  else
    ## check the current folder belong to earlier VIRTUAL_ENV folder
    # if yes then do nothing
    # else deactivate
      parentdir="$(dirname "$VIRTUAL_ENV")"
      if [[ "$PWD"/ != "$parentdir"/* ]] ; then
        deactivate
      fi
  fi
}

# Some visual glues like git repo in command line, using zstyle
zstyle :compinstall filename '/home/lightwanderer/.zshrc' 

# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

