#!/bin/sh

stop_all_process() {
    if pgrep -x lxqt-policykit-agent &>/dev/null; then
        killall lxqt-policykit-agent
    fi  
}

start_all_process() {
    lxqt-policykit-agent > /dev/null &
    xsetroot -cursor_name left_ptr
    setxkbmap br
    xinput set-prop 9 307 0 1 0
    xinput set-prop 9 304 -0.4
}

stop_all_process
start_all_process
