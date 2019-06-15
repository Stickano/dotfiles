#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '

source /usr/share/doc/pkgfile/command-not-found.bash
source /home/stick/dotfiles/.aliases
source /home/stick/dotfiles/.functions
source /usr/share/git/completion/git-completion.bash
source /usr/share/bash-completion/bash_completion
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

shopt -s autocd
shopt -s checkwinsize

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    eval "$(<~/.ssh-agent-thing)"
fi

# ## Colors?  Used for the prompt.
# #Regular text color
# BLACK='\[\e[0;30m\]'
# #Bold text color
# BBLACK='\[\e[1;30m\]'
# #background color
# BGBLACK='\[\e[40m\]'
# RED='\[\e[0;31m\]'
# BRED='\[\e[1;31m\]'
# BGRED='\[\e[41m\]'
# GREEN='\[\e[0;32m\]'
# BGREEN='\[\e[1;32m\]'
# BGGREEN='\[\e[1;32m\]'
# YELLOW='\[\e[0;33m\]'
# BYELLOW='\[\e[1;33m\]'
# BGYELLOW='\[\e[1;33m\]'
# BLUE='\[\e[0;34m\]'
# BBLUE='\[\e[1;34m\]'
# BGBLUE='\[\e[1;34m\]'
# MAGENTA='\[\e[0;35m\]'
# BMAGENTA='\[\e[1;35m\]'
# BGMAGENTA='\[\e[1;35m\]'
# CYAN='\[\e[0;36m\]'
# BCYAN='\[\e[1;36m\]'
# BGCYAN='\[\e[1;36m\]'
# WHITE='\[\e[0;37m\]'
# BWHITE='\[\e[1;37m\]'
# BGWHITE='\[\e[1;37m\]'

# PROMPT_COMMAND=smile_prompt

# function smile_prompt
# {
# 	if [ "$?" -eq "0" ]
# 	then
# 		#smiley
# 		SC="${GREEN}:)"
# 	else
# 		#frowney
# 		SC="${RED}:("
# 	fi
# 	if [ $UID -eq 0 ]
# 	then
# 		#root user color
# 		UC="${RED}"
# 	else
# 		#normal user color
# 		UC="${BWHITE}"
# 	fi
# 	#hostname color
# 	HC="${BBLUE}"
# 	#regular color
# 	RC="${BWHITE}"
# 	#default color
# 	DF='\[\e[0m\]'
# 	PS1="[${UC}\u${RC}@${HC}\h ${RC}\W${DF}] ${SC}${DF} "
# }

if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
	export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
	export TERM=xterm-256color
fi


# setting the colors
if tput setaf 1 &> /dev/null; then
	tput sgr0
	if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
		MAGENTA=$(tput setaf 9)
		ORANGE=$(tput setaf 172)
		GREEN=$(tput setaf 190)
		PURPLE=$(tput setaf 141)
		WHITE=$(tput setaf 3)
	else
		MAGENTA=$(tput setaf 5)
		ORANGE=$(tput setaf 4)
		GREEN=$(tput setaf 2)
		PURPLE=$(tput setaf 1)
		WHITE=$(tput setaf 7)
	fi
	BOLD=$(tput bold)
	RESET=$(tput sgr0)
else
	MAGENTA="\033[1;31m"
	ORANGE="\033[1;33m"
	GREEN="\033[1;32m"
	PURPLE="\033[1;35m"
	WHITE="\033[1;37m"
	BOLD=""
	RESET="\033[m"
fi

export MAGENTA
export ORANGE
export GREEN
export PURPLE
export WHITE
export BOLD
export RESET

function parse_git_dirty() {
	[[ $(git status 2> /dev/null | tail -n1) != *"working directory clean"* ]] && echo "*"
}

function parse_git_branch() {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

export PS1="\n\[${BOLD}${MAGENTA}\]\u \[$WHITE\]at \[$ORANGE\]\h \[$WHITE\]in \[$GREEN\]\w\[$WHITE\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$PURPLE\]\$(parse_git_branch)\[$WHITE\]\n\$ \[$RESET\]"
export PS2="\[$ORANGE\]→ \[$RESET\]"


export PATH="$(ruby -e 'puts Gem.user_dir')/bin:/home/stick/dotfiles/scripts:$HOME/.config/composer/vendor/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Metasploit - Needs to be in the bottom of this doc
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
