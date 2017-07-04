export NODE_ENV=user-custom

if [ -f ~/.bash_aliases ]; then
   . ~/.bash_aliases
fi

if [ -f ~/.bashrc ]; then
   . ~/.bashrc
fi

if [ -f ~/.git-completion.bash ]; then
   . ~/.git-completion.bash
fi

export NVM_DIR="$HOME/.nvm"

nvm() {
   if type nvm >/dev/null 2 >&1 && [ -f "$NVM_DIR/nvm.sh" ] ; then
      # if nvm is not loaded
      [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" && nvm "$@"
   else
      nvm "$@"
   fi
}
