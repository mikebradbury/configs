# Source config files
source ~/.aliases
source ~/.functions
source ~/.zsh_prompt

# EDITOR
export EDITOR=nvim

# Reverse search
bindkey '^r' history-incremental-search-backward

# History management
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
export HISTCONTROL=ignoreboth
export HISTSIZE=5000
export HISTIGNORE="clear:bg:fg:cd:cd -:cd ..:exit:date:w:* --help:ls:ll:lla:lsd"

# Initialise zsh completions
## The following lines were added by compinstall
zstyle :compinstall filename '/Users/mike_bradbury/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

## Colorize completions using default `ls` colors.
zstyle ':completion:*' list-colors ''

# Enable keyboard navigation of completions in menu
# (not just tab/shift-tab but cursor keys as well):
# zstyle ':completion:*' menu select

# pyenv config
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
