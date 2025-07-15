#!/bin/bash

# You can run `swaymsg -t get_outputs` to see your output names
INTERNAL="eDP-1"
EXTERNAL="HDMI-A-1"

if swaymsg -r -t get_outputs | jq -e \
    ".[] | select(.name == \"$EXTERNAL\" and .active == true)" > /dev/null; then
    swaymsg output "$EXTERNAL" enable
    swaymsg output "$INTERNAL" disable
else
    swaymsg output "$INTERNAL" enable
fi
