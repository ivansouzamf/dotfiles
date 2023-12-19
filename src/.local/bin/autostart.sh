#!/bin/sh

stop_all_process() {
    if pgrep -x waybar &>/dev/null; then
        killall waybar
    fi
    
    if pgrep -x swaybg &>/dev/null; then
        killall swaybg
    fi
}

start_all_process() {
    waybar &
    swaybg -m fill -i ~/Pictures/Wallpapers/circuit_board.jpg &
    hyprctl setcursor Sunity-cursors-white 24
}

stop_all_process
start_all_process
