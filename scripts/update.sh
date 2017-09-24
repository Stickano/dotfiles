#!/bin/bash

yes | pacman -Syyu
printf "%s\n" "Cleaning Orphans"
yes | pacman -Rns \(pacman -Qtdq\)
printf "%s\n" "Cleaning Package Cache"
yes | paccache -rk 2
printf "%s\n" "Optimizing Database"
yes | pacman -Sc && yes | pacman-optimize
printf "%s\n" "Done. You might have packages to handle:"
locate --existing --regex "\.pac(new|save)$"
