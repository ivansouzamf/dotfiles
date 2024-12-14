#!/bin/sh

stop_all_process() {
    if pgrep -x waybar &>/dev/null; then
        killall waybar
    fi
    
    if pgrep -x mpvpaper &>/dev/null; then
        killall mpvpaper
    fi   
    
    #if pgrep -x swaybg &>/dev/null; then
    #    killall swaybg
    #fi
}

start_all_process() {
    waybar &
    #swaybg -m fill -i ~/Pictures/Wallpapers/arch_magenta_blue.png &
    mpvpaper -vs -o "no-audio loop" HDMI-A-1 ~/Pictures/Wallpapers/Live/porsche-911_carrera.mp4 &
    hyprctl setcursor Sunity-cursors-white 24
}

stop_all_process
start_all_process
