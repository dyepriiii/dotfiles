# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

export CLICOLOR=YES

# auto cd
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=9999999
HISTFILESIZE=9999999

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# After each command, append to the history file and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r;echo -ne '\033]0;${HOSTNAME%%.*}: ${PWD/#$HOME/~}\007'"

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

#set term
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# source git_ps1 first
if [[ -e ~/bin/scripts/git-completion.bash ]]; then
    . ~/bin/scripts/git-completion.bash
fi
if [[ -e ~/bin/scripts/git-prompt.bash ]]; then
    . ~/bin/scripts/git-prompt.bash
fi

export TERM="xterm-256color"

# my ps1
export PS1='\[$(tput setaf 12)\]┌─[\[$(tput setaf 9)\] \u\[$(tput setaf 254)\]@\[$(tput setaf 136)\]\h \[$(tput setaf 12)\]]-[ \[$(tput setaf 64)\]\w\[$(tput setaf 37)\]$(__git_ps1 " (%s)")\[$(tput setaf 10)\] \[$(tput setaf 12)\]]\n└─ᐷ \[$(tput setaf 250)\]'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors.ansi-dark && eval "$(dircolors -b ~/.dircolors.ansi-dark)" || eval "$(dircolors -b)"
    alias ls='ls -F --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias sudo='sudo '
alias man='man '

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

export PATH=~/.local/bin:~/bin/scripts:$PATH

SSH_ENV=$HOME/.ssh/environment

export EDITOR=vim

# start the ssh-agent
eval `keychain --eval --agents ssh id_rsa`
# sudo autocomplete
complete -cf sudo

ssldate() { echo | openssl s_client -connect $1:443 -servername $1 2>/dev/null | openssl x509 -noout -dates; }
sslsubj() { echo | openssl s_client -connect $1:443 -servername $1 2>/dev/null | openssl x509 -noout -subject; }
sslall() { echo | openssl s_client -connect $1:443 -servername $1 2>/dev/null | openssl x509 -noout -text; }

alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias n="echo '  ñ'"
alias c='clear'
alias r='reset -Q'
alias xo='xdg-open'
alias edithosts='sudo vim /etc/hosts'
alias digs='dig +short'
alias ccat='pygmentize -g -O style=colorful,linenos=1'
alias glances='python -m glances'
alias ap='ansible-playbook'
alias locate='mlocate'
alias apt='sudo apt'

# mac
#alias locate='mdfind'
#test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# arch
#search() { pacman -Ss $1; aura -As $1; }
