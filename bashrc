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

# Aliases
alias vi=vim

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
