# NOTE: This is all additive to the base PATH set by the OS. Also, there are other
# additions to PATH set in the "frameworks" section.

# Add Visual Studio Code (code) on Mac
if [ -d "/Applications/Visual Studio Code.app/Contents" ] ; then
   export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
fi

# Use coreutils without the `g` prefix on MAC. This overrides the Mac default versions
# that are different than every other *nix environment.
export PATH="${HOMEBREW_CELLAR}/coreutils/8.32/libexec/gnubin:$PATH"

# set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/bin" ] ; then
   export PATH="${HOME}/bin:${PATH}"
fi

# tfenv (Terraform) setup for manual (git) install. If installed via brew or similar, this
# isn't needed.
if [ -d "${HOME}/.tfenv" ]; then
   export PATH="$HOME/.tfenv/bin:$PATH"
fi

# mysql client needs to be added to path separately from other homebrew
if [ -d "${HOMEBREW_PREFIX}/opt/mysql-client" ]; then
  export PATH="${HOMEBREW_PREFIX}/opt/mysql-client/bin:$PATH"
fi

# dart cli tools
if [ -d "${HOME}/.pub-cache" ]; then
  export PATH="${PATH}:${HOME}/.pub-cache/bin"
fi

# flutter
if [ -d "${HOME}/tooling/flutter" ]; then
  export PATH="${PATH}:${HOME}/tooling/flutter/bin"
fi

# mongo tools
if [ -d "${HOME}/tooling/mongodb" ]; then
  export PATH="${PATH}:${HOME}/tooling/mongodb/bin"
fi

# Add RVM to PATH for scripting.
if [ -d "${HOME}/.rvm/bin" ]; then
  export PATH="${HOME}/.rvm/bin:${PATH}"
fi
