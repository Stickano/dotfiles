if [ -f /etc/bash_completion ]; then
	    . /etc/bash_completion
fi

xhost +local:root > /dev/null 2>&1

# SSH-agent
if ! pgrep -u $USER ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval $(<~/.ssh-agent-thing)
fi


source /usr/share/doc/pkgfile/command-not-found.bash
source /usr/share/git/completion/git-completion.bash

source ~/.bash_aliases
source ~/.bash_functions

complete -cf sudo

shopt -s cdspell
shopt -s checkwinsize
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob


export HISTSIZE=10000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoredups
export JAVA_FONTS=/usr/share/fonts/TTF
export EDITOR=/usr/bin/nano


# prompt
#PS1='[\u@\h \W]/$ '
command fortune -a | fmt -80 -s | $(shuf -n 1 -e cowsay cowthink) -$(shuf -n 1 -e b d g p s t w y) -f $(shuf -n 1 -e $(cowsay -l | tail -n +2)) -n
echo -e "\n"
PS1='[ \W ]- \[\e[0;32m\]Yes, my lord?\[\e[m\] '

#path for script environment
PATH=$PATH:/home/stickano/.scripts
