# Set up HOMEBREW_PREFIX (/opt/homebrew for M1, /usr/local for everything else)
if [ -d "/opt/homebrew/" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"

  export PATH="${HOMEBREW_PREFIX}/bin:${HOMEBREW_PREFIX}/sbin${PATH+:$PATH}";
  export MANPATH="${HOMEBREW_PREFIX}/share/man${MANPATH+:$MANPATH}:";
  export INFOPATH="${HOMEBREW_PREFIX}/share/info:${INFOPATH:-}";
  export PATH="${HOMEBREW_PREFIX}/bin:${PATH}"
fi
