#!/bin/bash

rsync -a /home/stick/PhpstormProjects/axp/ axp:/data/virtual/hej_sites/axp --delete
while inotifywait -r -e modify,create,delete /home/stick/PhpstormProjects/axp/; do rsync -a /home/stick/PhpstormProjects/axp/ axp:/data/virtual/hej_sites/axp/ --delete; done
