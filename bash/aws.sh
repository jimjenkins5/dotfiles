# For awsume (https://awsu.me)
alias awsume=". awsume"
alias AWS=". awsume"

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


# TODO: I should really be using awsume, so I should remove this when I setup awsume in
# my workflow.
assumeRole() {
   eval $(assume-role --duration 9h $1)
}
