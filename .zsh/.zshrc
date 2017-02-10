# Sourced upon interactive shell.
# Shell configurations.

## General Settings 
HISTFILE=$ZDOTDIR/.histfile
HISTSIZE=5000
SAVEHIST=5000
bindkey -e							# Emacs
ttyctl -f							# Reset terminal when necessary
HIST_STAMPS="dd.mm.yyyy"			# TimeDate output
export SSH_KEY_PATH="~/.ssh/rsa_id"	# Export SSH path
REPORTTIME=3						# Report elapsed time > 3sec

## Keybinds
bindkey '^[[3^' kill-word			# Ctrl+delete /delete forwards
bindkey '^H' backward-kill-word		# Ctrl+backspace /delete backwards
bindkey '^[Oc' forward-word			# Ctrl+Left/Right /jump words
bindkey '^[Od' backward-word			

## Options 
setopt HIST_IGNORE_ALL_DUPS			# No duplicate entries in history
setopt AUTO_CD						# auto cd when excluded
setopt EXTENDED_GLOB				# Used by many of the extended features
setopt PROMPT_SP					# Preserves the lines above when completion kicks in
setopt interactivecomments			# Ignore lines prefixed with #
setopt hist_ignore_space			# Don't record to history if line begins with space
setopt sharehistory					# Share history between zsh processes 

## Source Files 
source ~/dotfiles/.aliases
source ~/dotfiles/.functions
source /usr/share/doc/pkgfile/command-not-found.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## History search with arrow keys 
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "${key[Up]}"   ]] && bindkey "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey "${key[Down]}" down-line-or-beginning-search
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search

## Preferred Editor 
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='vim'
fi

## Auto Completion
setopt COMPLETE_ALIASES					# Enable auto-complete
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select		# Double <tab> for completion menu
zstyle ':completion:*' rehash true		# Automaticly refresh $PATH 
COMPLETION_WAITING_DOTS="true"			# Red dots on wait-for-completion
CASE_SENSITIVE="true"					# Case Sensitive

## Theming
autoload -Uz promptinit					# Enable theming
promptinit

## Oh My Zsh
export ZSH=/usr/share/oh-my-zsh						# Installation Path & Plugins
plugins=(dirhistory encode64 screen sudo urltools web-search)
ZSH_THEME="ys"										# Theme
#zstyle :omz:plugins:ssh-agent agent-forwarding on	# SSH-agent (plugin)
source /usr/share/oh-my-zsh/oh-my-zsh.sh			# Configuration

