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

plugins=(virtualenv)

# Customize to your needs...
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=''
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv background_jobs command_execution_time)


export EDITOR='code'

export PATH=~/.composer/vendor/bin:$PATH

# Docker / Docker Compose
alias dco='docker-compose'
alias dcoe='docker-compose exec'
alias dcor='docker-compose run --rm'
alias dcol='docker-compose logs -f --tail=100'

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

drush() {
  if [ $(docker-compose ps -q drush 2> /dev/null) ]; then
    docker-compose run --rm drush $@
  else
    echo 'figure this out now...'
  fi
}

composer() {
  if [ $(docker-compose ps -q composer 2> /dev/null) ]; then
    docker-compose run --rm composer $@
  else
    /usr/local/bin/composer $@
  fi
}

wp() {
  if [ $(docker-compose ps -q wpcli) ]; then
    docker-compose run --rm wpcli wp $@
  else
    echo 'figure this out now...'
  fi
}
