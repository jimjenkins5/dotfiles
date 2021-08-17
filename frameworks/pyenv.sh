# pyenv setup
if [ -d "${HOME}/.pyenv" ]; then
   export PYENV_ROOT="${HOME}/.pyenv"
   export PATH="${PYENV_ROOT}/bin:${PATH}"
   if [ $(command -v pyenv) ]; then
      eval "$(pyenv init --path)"
   fi
fi
