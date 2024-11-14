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

alias vim="nvim"

#shell completions
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

source $ZSH/oh-my-zsh.sh

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/fidelisakilan/.dart-cli-completion/zsh-config.zsh ]] && . /Users/fidelisakilan/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

