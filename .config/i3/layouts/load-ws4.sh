#!/bin/bash
i3-msg "workspace 4: media; append_layout ~/dotfiles/.config/i3/layouts/workspace_4.json"

(pavucontrol &)
(urxvt -hold -name cmus -e zsh -c 'cmus; zsh' &)
(urxvt -hold -name cava -e zsh -c 'cava; zsh' &)
