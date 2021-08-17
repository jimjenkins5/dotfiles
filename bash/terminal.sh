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

# enable color support of ls and grep and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
   test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
   alias ls='ls --color=auto'
   alias grep='grep --color=auto'
   alias fgrep='fgrep --color=auto'
   alias egrep='egrep --color=auto'
fi

if [ -f ${HOMEBREW_PREFIX}/etc/bash_completion ]; then
   . ${HOMEBREW_PREFIX}/etc/bash_completion
fi

# Turn on CLI colours
export CLICOLOR=1
