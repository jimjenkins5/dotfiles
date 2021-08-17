export NVM_DIR="${HOME}/.nvm"
# node.js setup
export NODE_ENV=user-custom
# ensure the NVM_DIR exists, otherwise nvm will error, even on install.
mkdir -p "${NVM_DIR}"

if [ -f "${NVM_DIR}/nvm.sh" ]; then
   [ -s "${NVM_DIR}/nvm.sh" ] && \. "${NVM_DIR}/nvm.sh"  # This loads nvm
   [ -s "${NVM_DIR}/bash_completion" ] && \. "${NVM_DIR}/bash_completion"  # This loads nvm bash_completion
fi
