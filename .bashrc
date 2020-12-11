# Source config files
source ~/.aliases
source ~/.functions
source ~/.bash_prompt

[ -f ~/.bashrc.local ] && source ~/.bashrc.local

# EDITOR
export EDITOR=vim

# History management
export HISTCONTROL=ignoreboth
export HISTSIZE=5000
export HISTIGNORE="clear:bg:fg:cd:cd -:cd ..:exit:date:w:* --help:ls:ll:lla:lsd"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # loads nvm bash_completion

# Pyenv
eval "$(pyenv init -)"
export PYENV_ROOT=/Users/mike/.pyenv

# Bash Completions
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Safely Start tmux on load
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#  exec tmux
#fi
