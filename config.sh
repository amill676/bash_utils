# The following will only display the working directory. However if you
# set this on a machine you ssh into, it is hard to tell the difference
# between your local and remote terminals on the local machine. So I am
# disabling for now until I find a better way
#export PS1="\w$ "

# virtual env
#export WORKON_HOME=~/virtualenvs
#source /usr/local/bin/virtualenvwrapper.sh

export EDITOR=vim

# History stored for every shell
export PROMPT_COMMAND='history -a'
# Larger history
export HISTSIZE=5000
export HISTFILESIZE=500000
