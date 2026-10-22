# environment
export LANG=en_US.UTF-8

plugins=(
zsh-autosuggestions
zsh-vi-mode
)

HISTFILE="$HOME/.zsh_history"
HISTSIZE=500000
SAVEHIST=500000

export PATH="$PATH":"$HOME/sdk/flutter/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$PATH":"$HOME/.cargo/bin"
export PATH="$PATH":"$HOME/.local/bin"
export PATH="$PATH":"$HOME/Library/Android/sdk/platform-tools"
export PATH="$PATH":"$HOME/env-scripts"
export PATH="$PATH":"$HOME/sdk/google-cloud-sdk/bin"
export PATH="$PATH":"$HOME/sdk/fvm"
export PATH="$HOME/.cargo/bin:$PATH"
# DART
[[ -f /Users/fidelisakilan/.dart-cli-completion/zsh-config.zsh ]] && . /Users/fidelisakilan/.dart-cli-completion/zsh-config.zsh || true
export PATH="/opt/homebrew/bin:$PATH"
export CHROME_EXECUTABLE="/usr/bin/chromium"
export EDITOR="nvim"
export VISUAL="nvim"

## NVM
export NVM_DIR="$HOME/.nvm"
# lazy-load nvm: put default node on PATH now, load nvm itself on first use
_nvm_default=$(cat "$NVM_DIR/alias/default" 2>/dev/null)
_nvm_node=( "$NVM_DIR"/versions/node/v${_nvm_default#v}*(N/nOn) )
[ -z "$_nvm_node" ] && _nvm_node=( "$NVM_DIR"/versions/node/v*(N/nOn) )  # alias like "node"/"lts": use newest
[ -n "$_nvm_node" ] && export PATH="$_nvm_node[1]/bin:$PATH"
unset _nvm_default _nvm_node
nvm() {
  unset -f nvm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  nvm "$@"
}

eval "$(starship init zsh)"
source $HOME/.zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"


declare -A pomo_options
pomo_options["work"]="45"
pomo_options["break"]="10"

pomodoro () {
  if [ -n "$1" -a -n "${pomo_options["$1"]}" ]; then
  val=$1
  echo $val | lolcat
  timer ${pomo_options["$val"]}m
  spd-say "'$val' session done"
  fi
}

