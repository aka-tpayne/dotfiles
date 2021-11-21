#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc

plugins=(virtualenv)

# Customize to your needs...
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=''
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv background_jobs command_execution_time)


export EDITOR='vim'

export PATH=~/.composer/vendor/bin:$PATH

# Docker / Docker Compose
alias dco='docker-compose'
alias dcoe='docker-compose exec'
alias dcor='docker-compose run --rm'
alias dcol='docker-compose logs -f --tail=100'

# Git
alias s='git status -sb'

phpco() { docker run --init -v $PWD:/mnt/src:cached --rm -u "$(id -u):$(id -g)" frbit/phpco:latest $@; return $?; }

#source ~/.bin/tmuxinator.zsh

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# fnm
export PATH=$HOME/.fnm:$PATH
eval "`fnm env --multi`"

# Defer initialization of nvm until nvm, node or a node-dependent command is
# run. Ensure this block is only run once if .bashrc gets sourced multiple times
# by checking whether __init_nvm is a function.
# if [ -s "$HOME/.nvm/nvm.sh" ] && [ ! "$(type __init_nvm)" = function ]; then
#   export NVM_DIR=$(cd ~/.nvm && pwd -P)
#   [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
#   declare -a __node_commands=('nvm' 'node' 'npm' 'yarn' 'gulp' 'grunt' 'webpack')
#   function __init_nvm() {
#     for i in "${__node_commands[@]}"; do unalias $i; done
#     . "$NVM_DIR"/nvm.sh
#     unset __node_commands
#     unset -f __init_nvm
#   }
#   for i in "${__node_commands[@]}"; do alias $i='__init_nvm && '$i; done
# fi


phan() { docker run -v $PWD:/app --rm -u "$(id -u):$(id -g)" tpayne/phan:latest $@; return $?; }

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# thefuck
eval $(thefuck --alias)


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/usr/local/opt/ruby/bin:$PATH"
