#!/bin/bash
# Install multiple updates

cd ~/makepkg/packages && find . -name PKGBUILD -execdir makepkg -sirc \;
cd ~ && printf "%s\n" "Update Completed"

yes | rm -rf ~/makepkg/packages/*
printf "%s\n" "Cleaned Packages"
