#!/usr/bin/env bash

function run {
    if ! pgrep $1 > /dev/null; then
        $@&
    fi
}

run xrandr --output DP-0 --auto --output DP-2 --right-of DP-0
