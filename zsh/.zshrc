# environment
export LANG=en_US.UTF-8
export ZSH="$HOME/.oh-my-zsh"

# terminal theme
COMPLETION_WAITING_DOTS="true"
ZSH_THEME="robbyrussell"
zstyle ':omz:update' mode auto
zstyle ':omz:update' mode reminder

# zsh properties
plugins=(
git
zsh-autosuggestions
zsh-vi-mode
)

export PATH="$PATH":"$HOME/sdk/flutter/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$PATH":"$HOME/.cargo/bin"
export PATH="$PATH":"$HOME/.local/bin"
export PATH="$PATH":"$HOME/Library/Android/sdk/platform-tools"
export NVM_DIR="$HOME/.nvm"
export PATH="$PATH":"$HOME/env-scripts"
export PATH="$PATH":"$HOME/sdk/google-cloud-sdk/bin"
export PATH="$PATH":"$HOME/sdk/fvm"
export CHROME_EXECUTABLE=/usr/bin/chromium


source $ZSH/oh-my-zsh.sh

# if [ -z "$TMUX" ] && [ "$TERM" = "xterm-kitty" ]; then
#   tmux attach || exec tmux new-session && exit;
# fi

## [Completion]
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
