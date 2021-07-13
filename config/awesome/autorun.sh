#!/usr/bin/env bash

function run {
    if !pgrep -f $1; then
        $@&
    fi
}

run xrandr --output DP-0 --auto --output DP-2 --right-of DP-0
