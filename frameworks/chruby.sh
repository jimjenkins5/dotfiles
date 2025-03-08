if [ -d ${HOMEBREW_PREFIX}/opt/chruby ]; then
  source $HOMEBREW_PREFIX/opt/chruby/share/chruby/chruby.sh
  source $HOMEBREW_PREFIX/opt/chruby/share/chruby/auto.sh
  chruby ruby-3.4.2
fi
