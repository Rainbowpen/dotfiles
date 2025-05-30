#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return



# UTF-8 support
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Firefox wayland support
[[ $XDG_SESSION_TYPE == "wayland" ]] && export MOZ_ENABLE_WAYLAND=1

# XDG config
XDG_CONFIG_HOME=$HOME/.config
XDG_CACHE_HOME=$HOME/.cache
XDG_DATA_HOME=$HOME/.local/share

### vim
#export VIMINIT=":source $XDG_CONFIG_HOME"/vim/vimrc

### tmux
alias tmux='tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf'

### bat but cat
alias cat='bat --theme=OneHalfDark'

### ipython
export IPYTHONDIR="$XDG_CONFIG_HOME"/ipython


export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/lib/pkgconfig
export EDITOR=nvim

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ];
then
	#echo "ssh tty!!!"
	PS1='[\[\033[1;32m\]\u\[\033[1;m\]@\[\033[1;35m\]\h:\[\033[1;34m\]\W\[\033[0m\]]\[\033[1;31m\]\$\[\033[0m\] '
else
	#echo "local user!!!"
	PS1=' \033[1;34m\]\W \[\033[1;31m\]\$\[\033[0m\] '
fi


### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

PATH=$PATH:~/.local/bin:~/.cargo/bin


alias ..='cd ..'
alias cp='cp -i'
alias ls='ls --color=auto'
alias ll='ls -al'


# start fish shell
exec -l fish "$@"
