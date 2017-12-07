# Is always sourced.
# Used for setting environment variables.

# Environment Variables
#
# USER
export XDG_CONFIG_HOME=/home/stick/.config
export XDG_CACHE_HOME=/home/stick/.cache
export XDG_DATA_HOME=/home/stick/.local/share

# SYSTEM
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_CONFIGS_DIRS=/etc/xdg

# Locale
export LANG="en_US.utf-8"
export LC_COLLATE=C
export LC_MESSAGES="en_US.utf-8"
export LC_MONETARY="da_DK.utf-8"
export LC_NUMERIC="da_DK.utf-8"
export LC_TIME="en_US.utf-8"
export LC_ALL=

# Zsh dotfile directory
export ZDOTDIR=/home/stick/dotfiles/.zsh

# URxvt Xresources
export XENVIRONMENT=/home/stick/dotfiles/.Xresources

# Clutter and Games
export SDL_VIDEO_X11_DGAMOUSE=0

# Video Hardware Acceleration
export VDPAU_DRIVER=nvidia

# Ruby gem
export GEM_HOME=$(ruby -e 'print Gem.user_dir')

