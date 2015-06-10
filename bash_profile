
# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

PYTHONPATH="/Library/Frameworks/Python.framework/Versions/3.4/lib/python3.4/site-packages:${PYTHONPATH}"
export PYTHONPATH
export PATH=/usr/local/bin:$PATH

#if [ -f $(brew --prefix)/etc/bash_completion ]; then
#  . $(brew --prefix)/etc/bash_completion
#fi

bind 'set mark-symlinked-directories on'
