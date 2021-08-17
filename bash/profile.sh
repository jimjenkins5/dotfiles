#!/usr/bin/env bash

export BASH_SILENCE_DEPRECATION_WARNING=1
export DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../" >/dev/null 2>&1 && pwd )"

# Setup HomeBrew first so that we have the environment variables of other paths.
source "${DOTFILES_DIR}/frameworks/homebrew.sh"

# Setup core configurations
source "${DOTFILES_DIR}/bash/path.sh"
source "${DOTFILES_DIR}/bash/terminal.sh"
source "${DOTFILES_DIR}/bash/prompt.sh"
source "${DOTFILES_DIR}/editors/setup.sh"

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
   . /etc/bash_completion
fi

# Setup various development applications and functionality
source "${DOTFILES_DIR}/git/setup.sh"
source "${DOTFILES_DIR}/frameworks/setup.sh"
source "${DOTFILES_DIR}/frameworks/aws.sh"
source "${DOTFILES_DIR}/bash/serverless.sh"

# Setup miscellanious alliases
source "${DOTFILES_DIR}/bash/aliases.sh"

# Load bash aliases that won't be copied to the git repo
if [ -f "$HOME/.aliases_local" ]; then
    source "$HOME/.aliases_local"
fi





