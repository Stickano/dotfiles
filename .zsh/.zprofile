# Sourced upon login shell.
# Used for executing commands.

# To prevent path not being overriden by .zshenv 
typeset -U path
path=(~/bin /home/stick/.scripts /usr/local/bin $path[@])


