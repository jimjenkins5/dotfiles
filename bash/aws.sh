# For awsume (https://awsu.me)

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

# TODO: I should really be using awsume, so I should remove this when I setup awsume in
# my workflow.
assumeRole() {
   eval $(assume-role --duration 9h $1)
}
