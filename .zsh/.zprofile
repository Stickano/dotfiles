# Sourced upon login shell.
# Used for executing commands.

# To prevent path not being overriden by .zshenv 
typeset -U path
path=($(ruby -e "print Gem.user_dir")/bin:~/bin:$HOME/.config/composer/vendor/bin:/home/stick/dotfiles/scripts:/usr/local/jdk1.7.0/bin:/usr/local/bin:/bin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/php/bin:/usr/local/php5/bin:$path[@])

# Start x
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi

$ [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
