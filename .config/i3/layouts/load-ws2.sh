#!/bin/bash
i3-msg "workspace 2: term; append_layout ~/dotfiles/.config/i3/layouts/workspace_2.json"

(urxvt -hold -name ws21 -e zsh -c 'alsi -l; zsh' &)
(urxvt -hold -name ws23 -e zsh -c 'cd /home/stick/dotfiles; git status; zsh' &)
(urxvt -hold -name ws22 -e zsh -c 'ranger; zsh' &)
