export NODE_ENV=user-custom

if [ -f ~/.bashrc ]; then
   . ~/.bashrc
fi

# Load bash aliases that won't be copied to the git repo
if [ -f ~/.bash_aliases_local ]; then
    source ~/.bash_aliases_local
fi
