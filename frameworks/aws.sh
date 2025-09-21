# For awsume (https://awsu.me)
unalias awsume 2>/dev/null
unalias AWS 2>/dev/null

# Setup awsume command and autocomplete if installed
if [ $(command -v awsume) ]; then
   AWSUME_COMMAND="awsume"

   # If pyenv is installed, we need to alias awsume command to the full path of the awsume
   # file before re-aliasing it as `. awsume`. Otherwise, pyenv will error when looking for
   # the script using '. awsume' as the name.
   # See https://github.com/trek10inc/awsume/issues/49
   if [ $(command -v pyenv) ]; then
      AWSUME_COMMAND=$(pyenv which awsume)
   fi
   alias awsume=". $AWSUME_COMMAND"
   alias AWS=". $AWSUME_COMMAND"

   _awsume() {
      local cur prev opts
      COMPREPLY=()
      cur="${COMP_WORDS[COMP_CWORD]}"
      prev="${COMP_WORDS[COMP_CWORD-1]}"
      opts=$(awsume-autocomplete)
      COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
      return 0
   }
   complete -F _awsume awsume
   complete -F _awsume AWS
fi

# Setup assume if installed
if [ $(command -v assume) ]; then
  function assume {
    source assume $@
    # Serverless (SLS) fails when AWS_PROFILE is set, so we unset it here
    unset AWS_PROFILE
  }
fi

# Alias to unset AWS environment variables
alias unsetAWS='unset $(env | grep AWS | grep -v AWS_REGION | grep -v AWS_DEFAULT_REGION | sed '\''s|=.*||'\'')'

