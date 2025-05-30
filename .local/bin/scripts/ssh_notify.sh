#! /bin/bash
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ];
then
	#echo "ssh tty!!!"
	#notify-send "User $(whoami) has logined at $(date) via SSH!!!"
	curl \
         -H "Email: simonjanmanager@gmail.com" \
         -H "Title: SSH logined" \
	     -H "Priority: urgent" \
	     -H "Tags: warning,skull" \
	     -d "💻️ $(hostname) has been logined by $(whoami) at $(date) via SSH!!!"
         ntfy.hoohoo.dedyn.io/homelab &
fi
