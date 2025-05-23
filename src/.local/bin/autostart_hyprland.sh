#!/bin/sh

commands=(
    "waybar"
    "mpvpaper -vs -o \"no-audio loop\" HDMI-A-1 ~/Pictures/Wallpapers/Live/porsche-911_carrera.mp4"
    #"swaybg -m fill -i ~/Pictures/Wallpapers/arch_magenta_blue.png",
    "hyprctl setcursor Sunity-cursors-white 24"
)

try_kill() {
    if pgrep -x $1 &>/dev/null; then
       killall $1 
    fi
}

stop_all_commands() {
    for cmd in "${commands[@]}"; do
        raw_cmd="${cmd%% *}"
        echo "Killing -> $raw_cmd"
        try_kill $raw_cmd
    done
}

run_all_commands() {
    for cmd in "${commands[@]}"; do
        echo "Running -> $cmd"
        $cmd &>/dev/null &
    done
}

stop_all_commands
run_all_commands
