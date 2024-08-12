set fish_greeting


## keybind
bind \ee '' ## overwriting default keybind to nothing

alias ..="cd .."
alias cp="cp -i"
alias rmi="rm -i"
alias df="df -h"
alias vim="nvim"
alias speedtest="~/.local/bin/scripts/speed_test.py"
alias sonyt="~/.local/bin/scripts/sonyt.sh"
alias cat="bat --theme=OneHalfDark"
alias lg="lazygit"
alias trans="trans :zh-TW -speak -d -show-prompt-message n \
             -show-translation-phonetics n -j"
function pj
  if set project_path $(find ~/Projects/* -maxdepth 0 -type d,l -print | \
    fzf --ansi --preview="exa -a --icons --colour=always {}; \
    echo "\n" \
    tokei {}; \
    echo "\n" \
    [ -f "{}/README.md" ] && bat --theme=OneHalfDark -p \
    --color=always {}/README.md" \
    )
    cd $project_path && vim .
  end 
end

## thefuck alias
thefuck --alias | source 

alias ls="exa --icons"
alias ll="exa --icons -alh"
#if [ "$XDG_SESSION_TYPE" = "tty" ]
#	# in tty
#	alias ll="ls -alh"
#else
#	# in wayland or something else
#	alias ls="logo-ls"
#	alias ll="logo-ls -alh -T ANSIC"
#end

# mount sshfs
##lab
alias mountlab="sshfs lab:/home/simon ~/Remote/lab"
alias umountlab="fusermount -u ~/Remote/lab"

##thinkpad
alias mountpad="sshfs home_thinkpad:/home/simon ~/Remote/thinkpad"
alias umountpad="fusermount -u ~/Remote/thinkpad"

##lena
alias mountlena="sshfs home_router:/home/lena ~/Remote/lena"
alias umountlena="fusermount -u /home/simon/Remote/lena"

##truenas
alias mountserver="sshfs truenas.lan:  /mnt/mypool/simons-space ~/Remote/truenas"
alias umountserver="fusermount -u ~/Remote/truenas"


alias wka="sh ~/Documents/scripts/wakeamd.sh"
alias bu="sh ~/Documents/scripts/autoBackUp.sh"
#alias lab="sshpass -p (gpg -d -q ~/Documents/pw/lab_simon.gpg) ssh -o StrictHostKeyChecking=no lab"
#alias labst="sshpass -p (gpg -d -q ~/Documents/pw/lab_stmanager.gpg) ssh -o StrictHostKeyChecking=no lab-st"

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


