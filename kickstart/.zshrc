# Zsh command history
HISTFILE=~/.zsh_cmd_history # Where to save history to disk
HISTSIZE=5000 # How many lines of history to keep in memory
SAVEHIST=10000 # Number of history entries to save to disk

# Zsh opts
setopt appendhistory #Append history to the history file (no overwriting)
setopt sharehistory #Share history across terminals
setopt incappendhistory #Immediately append to the history file, not just when a term is killed
setopt nomatch 
unsetopt autocd beep extendedglob notify
unsetopt MULTIBYTE

# check key values using: read -r
# check current binds using: bindkey
# generate this file using: autoload zkbd ; zkbd
source ~/.zkbd/xterm-256color-:1

bindkey "${key[Home]}" beginning-of-line
bindkey "${key[End]}" end-of-line
bindkey "${key[Delete]}" delete-char
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^H" backward-kill-word
bindkey "^[[3;5~" kill-word
#bindkey -e # What set of key binds to use (vim or emacs)

source ~/.zsh_vars

# aliases
alias gst="git status"
alias gpa="git pull --all -p"
alias gca="git commit -am"
alias gdf="git diff"
alias l="exa -lah -s name"
alias bat="batcat"

export PATH=/usr/local/go/bin:$PATH
export PATH=$HOME/go/bin:$PATH

export PATH=/usr/local/node/bin:$PATH

export JAVA_HOME=/usr/local/jdk
export PATH=$JAVA_HOME/bin:$PATH

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

# zsh styling
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '[git] %b '
setopt PROMPT_SUBST
PROMPT='%F{green}%*%f | %F{white}%n%f> %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '

# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'

