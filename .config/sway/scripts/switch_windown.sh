#!/bin/sh

theme="style_7"
dir="$HOME/.config/rofi/launchers/text"
color="black.rasi"
sed -i -e "s/@import .*/@import \"$color\"/g" $dir/styles/colors.rasi

# ------Get available windows:
windows=$(swaymsg -t get_tree |
    jq -r '.nodes[].nodes[] | if .nodes then [recurse(.nodes[])] else [] end +  .floating_nodes  |  .[]  |  select(.nodes==[]) | ((.id | tostring) + " " + .name)' | awk 'NR!=1')

# ------Limit wofi's height with the number of opened windows:
height=$(echo "$windows" | wc -l)

# ------Select window with wofi:
selected=$(echo "$windows" | rofi -no-lazy-grab -theme $dir/$theme -dmenu -i --lines "$height" -p "Switch to:" | awk '{print $1}')

# ------Tell sway to focus said window:
swaymsg [con_id="$selected"] focus

