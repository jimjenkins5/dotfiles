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
