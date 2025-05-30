set fish_greeting

## keybind
bind \ee '' ## overwriting default keybind to nothing

## add path
fish_add_path ~/.local/bin ~/.cargo/bin


alias ..="cd .."
alias cp="cp -i"
alias rmi="rm -i"
alias cpr='rsync -avhP' # rsync-based cp with progress
alias mvr='rsync -avhP --remove-source-files' # rsync-based mv with progress
# alias df="df -h"
alias df="dysk"
alias vim="nvim"
alias vi="nvim"
alias vimm="nvim"
alias ai="aichat"
alias speedtest="~/.local/bin/scripts/speed_test.py"
alias sonyt="~/.local/bin/scripts/sonyt.sh"
#alias cat="bat --theme=OneHalfDark"
alias lg="lazygit"
alias trans="trans :zh-TW -speak -d -show-prompt-message n \
             -show-translation-phonetics n -j"
alias ls="eza --icons"
alias ll="eza --icons -alh"
set -Ux MANPAGER 'nvim +Man!'

function pj
  if set project_path $(find ~/Projects/* -maxdepth 0 -type d,l -print | \
    fzf --ansi --preview="exa -a --icons --colour=always {}; \
    echo "\n" \
    tokei {}; \
    echo "\n" \
    [ -f "{}/README.md" ] && bat --theme=OneHalfDark -p \
    --color=always {}/README.md" \
    )
    cd $project_path && yazi
  end
end




# mount sshfs
##lab
#alias mountlab="sshfs lab:/home/simon ~/Remote/lab"
#alias umountlab="fusermount -u ~/Remote/lab"

##thinkpad
#alias mountpad="sshfs home_thinkpad:/home/simon ~/Remote/thinkpad"
#alias umountpad="fusermount -u ~/Remote/thinkpad"

##lena
#alias mountlena="sshfs home_router:/home/lena ~/Remote/lena"
#alias umountlena="fusermount -u /home/simon/Remote/lena"

##truenas
#alias mountserver="sshfs truenas.lan:  /mnt/mypool/simons-space ~/Remote/truenas"
#alias umountserver="fusermount -u ~/Remote/truenas"


#alias wka="sh ~/Documents/scripts/wakeamd.sh"
#alias bu="sh ~/Documents/scripts/autoBackUp.sh"
#alias lab="sshpass -p (gpg -d -q ~/Documents/pw/lab_simon.gpg) ssh -o StrictHostKeyChecking=no lab"
#alias labst="sshpass -p (gpg -d -q ~/Documents/pw/lab_stmanager.gpg) ssh -o StrictHostKeyChecking=no lab-st"

# git
#alias addup='git add -u'
#alias addall='git add .'
#alias branch='git branch'
#alias checkout='git checkout'
#alias clone='git clone'
#alias commit='git commit -m'
#alias fetch='git fetch'
#alias pull='git pull origin'
#alias push='git push origin'
#alias gstatus='git status'
#alias tag='git tag'
#alias newtag='git tag -a'

# Attach tmux session if is using ghostty and none of tmux session has
# been attached.
if test $TERM = "xterm-ghostty"; and not test $TERM_PROGRAM = "tmux"; and not test (tmux list-clients)
    ## ssh login notification.
    ~/.local/bin/scripts/ssh_notify.sh
    .local/bin/scripts/fix_tmux_resurrect-files.sh
    tmux att || tmux
end

# Set up fzf key bindings
fzf --fish | source

zoxide init fish --cmd cd | source

# Emulates vim's cursor shape behavior
# Set the normal and visual mode cursors to a block
set fish_cursor_default block
# Set the insert mode cursor to a line
set fish_cursor_insert line
# Set the replace mode cursors to an underscore
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore
# Set the external cursor to a line. The external cursor appears when a command is started.
# The cursor shape takes the value of fish_cursor_default when fish_cursor_external is not specified.
set fish_cursor_external line
# The following variable can be used to configure cursor shape in
# visual mode, but due to fish_cursor_default, is redundant here
set fish_cursor_visual block
