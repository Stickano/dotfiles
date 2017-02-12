#!/bin/bash
i3-msg "workspace 10: Damage Control; append_layout ~/dotfiles/.config/i3/layouts/workspace_10.json"

(urxvt -hold -name ws01 -e zsh -c 'dmesg -w' &)
(urxvt -hold -name ws02 -e zsh -c 'journalctl -xef' &)
(urxvt -hold -name ws03 -e zsh -c 'cd /var/log; ls -ll --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F; systemd-analyze; zsh' &)
(urxvt -hold -name ws04 -e zsh -c 'htop' &)
