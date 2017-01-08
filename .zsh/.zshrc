# Sourced upon interactive shell.
# Shell configurations.

HISTFILE=$ZDOTDIR/.histfile
HISTSIZE=5000
SAVEHIST=5000
setopt autocd extendedglob
bindkey -v


# # # # # # # # # # # # # # #
# Auto Completion
#
# Enable auto-complete
autoload -Uz compinit
compinit
setopt COMPLETE_ALIASES

# Double <tab> for completion menu
zstyle ':completion:*' menu select

# Automaticly refresh $PATH 
zstyle ':completion:*' rehash true

# Red dots on wait-for-completion
COMPLETION_WAITING_DOTS="true"

# Case Sensitive
CASE_SENSITIVE="true"


# # # # # # # # # # # # # # #
# Theming
# 
# Enable theming
autoload -Uz promptinit
promptinit


# # # # # # # # # # # # # # #
# Other Settings
#
# Reset terminal if application crashes abnormally
ttyctl -f

# Search with arrow keys
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "${key[Up]}"   ]] && bindkey "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey "${key[Down]}" down-line-or-beginning-search

# Time/Date output
HIST_STAMPS="dd.mm.yyyy"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='vim'
fi

# Export SSH Path
export SSH_KEY_PATH="~/.ssh/rsa_id"


# # # # # # # # # # # # # # #
# Source Files
#
# Aliases & Functions
source ~/dotfiles/.aliases
source ~/dotfiles/.functions

# Search repository when command not found
source /usr/share/doc/pkgfile/command-not-found.zsh


# # # # # # # # # # # # # # #
# Oh My Zsh
#
# Oh My Zsh Installation
export ZSH=/usr/share/oh-my-zsh

# Oh My Zsh Plugins
plugins=(dirhistory encode64 screen sudo urltools web-search ssh-agent)

# Theme;  https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="ys"

# SSH-agent (OMZ plugin)
zstyle :omz:plugins:ssh-agent agent-forwarding on

# Oh My Zsh Configuration
source /usr/share/oh-my-zsh/oh-my-zsh.sh
