# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#################################################################################
# // start BUNKER aliases //
#################################################################################

alias t='top'
alias ht='htop' 
alias th='htop' 
alias x='exit' 
alias c='clear'

alias ls='ls --color' 
alias ll='ls -lh --color'
alias la='ls -A --color'
alias l='ls -CF --color'
alias lrt='ls -lhrt --color' 
alias lrs='ls -lhrs --color' 
alias lrtr='ls -lht --color' 
alias lrsr='ls -lhs -color' 
alias l='ls --color' 

# go somewhere
alias ..='cd ..'
alias ...='cd ../..' 
alias ....='cd ../../..' 
alias cd..='cd ..' 
alias cd...='cd ../..' 
alias cd....='cd ../../..' 
alias d='cd ~/Desktop' 
alias dn='cd ~/Downloads' 

alias evince='atril' 

alias f='firefox &'
alias ch='chromium-browser &'
alias goo='google-chrome &' 

alias p='python2.7' 
alias python='python2.7'

alias sleep='systemctl suspend'
alias refresh_fontcache='fc-cache -vf'
alias getpid='xprop _NET_WM_PID | cut -d" " -f3'

# view images or image sequences
alias i='feh -F *.jpg *.JPG *.PNG *.png'
alias m='/opt/hfs18.5/bin/mplay \*.exr \*.jpg'
alias r='/opt/hfs18.5/bin/mplay \*.exr \*.jpg'

# Houdini
alias h='/opt/hfs18.0/bin/houdinifx'
alias h185='/opt/hfs18.5/bin/houdinifx'

# NEOVIM!
alias v='nvim'
alias z='nvim' 
alias n='nvim' 

# VPN and killswitch
alias vpnon='nordvpn connect' 
alias vpnoff='nordvpn disconnect' 
alias killswitchon='nordvpn set killswitch on' 
alias killswitchoff='nordvpn set killswitch off' 

# remote work
alias nomachine='/usr/NX/bin/nxplayer --geometry 1920x1080 &'
alias killno='killall nxplayer.bin'

# GIT 
alias gs='git status'
alias gc='git commit -m'
alias gp='git push'
alias ga='git add'
alias grm='git rm'

wac=`/usr/bin/xsetwacom --list | wc -l `
if [ $wac != 0 ]; then
    # disable all the wacom buttons if tablet detected
    xsetwacom --set 'Wacom Intuos4 6x9 Pad pad' 'AbsWheelUp' 'button 0'
    xsetwacom --set 'Wacom Intuos4 6x9 Pad pad' 'AbsWheelDown' 'button 0'
    xsetwacom --set 'Wacom Intuos4 6x9 Pad pad' 'AbsWheel2Up' 'button 0'
    xsetwacom --set 'Wacom Intuos4 6x9 Pad pad' 'AbsWheel2Down' 'button 0'
    xsetwacom --set 'Wacom Intuos4 6x9 Pad pad' 'RelWheelUp' 'button 0'
    xsetwacom --set 'Wacom Intuos4 6x9 Pad pad' 'RelWheelDown' 'button 0'
    xsetwacom -s --set "Wacom Intuos4 6x9 Pad pad" Button 1 "button 0"
    xsetwacom -s --set "Wacom Intuos4 6x9 Pad pad" Button 2 "button 0"
    xsetwacom -s --set "Wacom Intuos4 6x9 Pad pad" Button 3 "button 0"
    xsetwacom -s --set "Wacom Intuos4 6x9 Pad pad" Button 8 "button 0"
    xsetwacom -s --set "Wacom Intuos4 6x9 Pad pad" Button 9 "button 0"
    xsetwacom -s --set "Wacom Intuos4 6x9 Pad pad" Button 10 "button 0"
    xsetwacom -s --set "Wacom Intuos4 6x9 Pad pad" Button 11 "button 0"
    xsetwacom -s --set "Wacom Intuos4 6x9 Pad pad" Button 12 "button 0"
    xsetwacom -s --set "Wacom Intuos4 6x9 Pad pad" Button 13 "button 0"
fi

# fix the delete key in ST terminal
tput smkx

# edit this file
alias aliases='nvim ~/.bashrc'
# add some private bashrc commands
source ~/.bashrc_pr

#################################################################################
# // end BUNKER aliases // 
#################################################################################

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
