# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Android paths - adjust if needed
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:/usr/local/bin
export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # Загружает NVM
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # Автодополнение

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="robbyrussell"

# Plugins
plugins=(
  git
  zsh-npm-scripts-autocomplete
)

source $ZSH/oh-my-zsh.sh

# Function to ignore Enter key
function ignore_enter() {
  return 0
}

# Function to bind Enter key based on command
function bind_enter_key() {
  local cmd=$(echo $BUFFER)

  if [[ "$cmd" == npm* ]] && [[ "$cmd" == "npm install"* || "$cmd" == "npm i"* || "$cmd" == "npm ci"* ]]; then
    bindkey -M menuselect '^M' ignore_enter
  elif [[ "$cmd" == npm* ]]; then
    bindkey -M menuselect '^M' .accept-line
  else
    bindkey -M menuselect '^M' .expand-or-complete
  fi
}

# Set initial key binding
bind_enter_key

# Add bind_enter_key to zle-line-finish event
zle -N zle-line-finish bind_enter_key

alias gs="git status"
alias gco="git checkout"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gpo="git pull origin"
alias gfa="git fetch --all"
