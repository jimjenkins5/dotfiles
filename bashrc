#!/usr/bin/env bash

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

# Turn on CLI colours
export CLICOLOR=1

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Editors
export EDITOR='vim'
export SVN_EDITOR=vim

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
   . ~/.bash_aliases
fi

if [ -f ~/.git-completion.bash ]; then
   . ~/.git-completion.bash
fi

# Load bash aliases that won't be copied to the git repo
if [ -f ~/.bash_aliases_local ]; then
    source ~/.bash_aliases_local
fi

rmcache () {
   pushd ~/jworg-cs/content-core/
   rm -rf ~/jworg-cs/.sscache/* ~/jworg-cs/.sscache/.cache*
   php cli.php CacheResetTask --entire
   popd
}


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
   . /etc/bash_completion
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
   PATH="$HOME/bin:$PATH"
fi

# Git autocompletion
if [ -d ~/cms-team/settings/ ]; then
   source ~/cms-team/settings/git-completion.sh
fi

# Custom aliases
alias gitco='bgit -p ~/jworg-cs --verbose --checkout'
alias gitup='bgit -p ~/jworg-cs --verbose --update'
alias ag='ag --pager="less -r"'

###################################################################
#                       My Awesome Prompt                         #
###################################################################
# get user name if different from logged in name (i.e. you are su'ing)
function get_user_name_if_different() {
   if [ ! "${USER}" == "${LOGNAME}" ]; then
      echo "${USER}@"
   else
      echo ""
   fi
}

# get current branch in git repo
function parse_git_branch() {
   BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
   if [ ! "${BRANCH}" == "" ]; then
     STAT=`parse_git_dirty`
     echo ":${BRANCH}${STAT}"
   else
      echo ""
   fi
}

# get current status of git repo
function parse_git_dirty {
   status=`git status 2>&1 | tee`
   dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
   untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
   ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
   newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
   renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
   deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
   bits=''
   if [ "${renamed}" == "0" ]; then
      bits=">${bits}"
   fi
   if [ "${ahead}" == "0" ]; then
      bits="*${bits}"
   fi
   if [ "${newfile}" == "0" ]; then
      bits="+${bits}"
   fi
   if [ "${untracked}" == "0" ]; then
      bits="?${bits}"
   fi
   if [ "${deleted}" == "0" ]; then
      bits="x${bits}"
   fi
   if [ "${dirty}" == "0" ]; then
      bits="!${bits}"
   fi
   if [ ! "${bits}" == "" ]; then
      echo " ${bits}"
   else
      echo ""
   fi
}

# export both functions and PS1 to make them available in su
export -f parse_git_dirty
export -f parse_git_branch
export -f get_user_name_if_different

ps1_username_color="\[\033[38;5;28m\]"
ps1_dir_color="\[\033[38;5;33m\]"
ps1_branch_color="\[\033[38;5;245m\]"
ps1_no_color="\[\e[m\]"

export PS1="$ps1_username_color\`get_user_name_if_different\`\h:$ps1_dir_color\W$ps1_branch_color\`parse_git_branch\`$ps1_no_color\\$ "

###################################################################
#                   End My Awesome Prompt                         #
###################################################################

export NVM_DIR="$HOME/.nvm"
export PATH=$NVM_DIR/current/bin:$PATH
export MANPATH=$NVM_DIR/current/share/man:$MANPATH
export NVM_SYMLINK_CURRENT=true
nvm() {
   [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
   [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
   nvm "${@}"
}
