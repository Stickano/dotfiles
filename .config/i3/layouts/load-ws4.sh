#!/bin/bash
i3-msg "workspace 4: media; append_layout ~/dotfiles/.config/i3/layouts/workspace_4.json"

(deadbeef &)
(pavucontrol &)
