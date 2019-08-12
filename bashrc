# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

PYTHONPATH="/Library/Frameworks/Python.framework/Versions/3.4/lib/python3.4/site-packages:${PYTHONPATH}"
export PYTHONPATH
export PATH=/usr/local/bin:~/.composer/vendor/bin:$PATH

#if [ -f $(brew --prefix)/etc/bash_completion ]; then
#  . $(brew --prefix)/etc/bash_completion
#fi

bind 'set mark-symlinked-directories on'

# Add ssh key for ec2-user #
ssh-add ~/.ssh/id_rsa-pem-emfl &> /dev/null
# Add ssh key for tpayne
ssh-add ~/.ssh/id_rsa &> /dev/null

# Aliases
alias vi=vim
alias ls='ls -G'
alias drush7='~/drush/drush7/vendor/bin/drush'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Base16 Shell
# BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
# [[ -s $BASE16_SHELL  ]] && source $BASE16_SHELL

export EDITOR='vim'

# tmuxinator completions
source $HOME/.tmuxinator/completions.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
