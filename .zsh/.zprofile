# Sourced upon login shell.
# Used for executing commands.

# To prevent path not being overriden by .zshenv 
typeset -U path
path=(~/bin /home/stick/dotfiles/scripts /usr/local/bin $path[@])

# Start x
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi
