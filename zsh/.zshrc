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
export NVM_DIR="$HOME/.nvm"
export PATH="$PATH":"$HOME/env-scripts"
export PATH="$PATH":"$HOME/sdk/google-cloud-sdk/bin"
export PATH="$PATH":"$HOME/sdk/fvm"
export PATH="/opt/homebrew/bin:$PATH"

#NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#PYENV
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# DART
[[ -f /Users/fidelisakilan/.dart-cli-completion/zsh-config.zsh ]] && . /Users/fidelisakilan/.dart-cli-completion/zsh-config.zsh || true

eval "$(starship init zsh)"
source $HOME/.zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh


