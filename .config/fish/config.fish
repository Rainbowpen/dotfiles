set fish_greeting

alias ..="cd .."
alias cp="cp -i"
alias rmi="rm -i"
alias df="df -h"
alias trash="mv -t ~/.trash/"
alias ctrash="rm -rf ~/.trash/*"
alias vim="nvim"
alias speedtest="~/.local/bin/scripts/speed_test.py"
alias cat="bat --theme=OneHalfDark"

if [ "$XDG_SESSION_TYPE" = "tty" ]
	# in tty
	alias ll="ls -alh"
else
	# in wayland or something else
	alias ls="logo-ls"
	alias ll="logo-ls -alh -T ANSIC"
end

# git
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias gstatus='git status'
alias tag='git tag'
alias newtag='git tag -a'


