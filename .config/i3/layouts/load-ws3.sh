#!/bin/bash
i3-msg "workspace 3: devel; append_layout ~/dotfiles/.config/i3/layouts/workspace_3.json"

(subl3 &)
(firefox -no-remote -p "local" localhost/adminer &)
