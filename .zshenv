# Is always sourced.
# Used for setting environment variables.

# Don't override importent theme variable. 
setopt NO_GLOBAL_RCS

# Environment Variables
#
# USER
export XDG_CONFIG_HOME=/home/stick/.config
export XDG_CACHE_HOME=/home/stick/.cache
export XDG_DATA_HOME=/home/stick/.local/share

# SYSTEM
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_CONFIGS_DIRS=/etc/xdg

# Zsh dotfile directory
export ZDOTDIR=/home/stick/dotfiles/.zsh

# URxvt Xresources
export XENVIRONMENT=/home/stick/dotfiles/.Xresources

# Clutter and Games
export SDL_VIDEO_X11_DGAMOUSE=0
