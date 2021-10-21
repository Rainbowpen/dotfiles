#!/bin/bash
timeout="10000"

# Lock it up! 
  i3lock -t -e -f -k -i "/home/simon/Pictures/i3_img/i3lock.jpg" \
  	  --clock --datestr "Hey!! What're u doing here?" \
   	  --insidecolor="#00000030" --ringcolor="#ffffffff" --line-uses-inside \
  	  --keyhlcolor="#d23c3dff" --bshlcolor="#d23c3dff" --separatorcolor="#00000000" \
  	  --insidevercolor="#fecf4dff" --insidewrongcolor=#d23c3dff \
  	  --ringvercolor="#ffffffff" --ringwrongcolor="#ffffffff" --indpos="x+960:h-740" \
  	  --radius=100 --ring-width=3 --veriftext="Let me thinking" --wrongtext="Not today" \
   	  --timecolor="#000000ff" --datecolor="#000000ff"
 
 # If still locked after $timeout milliseconds, turn off screen. 
 while [[ $(pgrep -x i3lock) ]]; do 
 	[[ $timeout -lt $(xssstate -i) ]] && xset dpms force off 
	sleep 3 
 done 
