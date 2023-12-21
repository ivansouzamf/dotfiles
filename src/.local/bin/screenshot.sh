#!/bin/sh
grim -g "$(slurp)" - | tee > $HOME/Pictures/Screenshots/"$(date +"%d-%m-%Y_%H-%M-%S")" >(wl-copy -t image/png)
