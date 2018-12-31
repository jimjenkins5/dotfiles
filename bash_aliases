alias ll="ls -la"

rmd() {
   pandoc $1 | lynx -stdin
}

updateMergeBase() {
   MERGE_BASE=$(git merge-base $(git rev-parse --abbrev-ref --symbolic-full-name @{u}) $(git rev-parse --abbrev-ref HEAD))
}

safeRebase() {
   updateMergeBase
   git rebase -i ${MERGE_BASE}
}

assumeRole() {
   eval $( $(which assume-role) $@);
}

slsLogs ()
{
    LOGS_FN="$1";
    shift;
    sls logs -t -f "${LOGS_FN}" --startTime "$(gdate -u +'%Y-%m-%dT%H:%M:%SZ' -d '3 min ago')" $@
}

alias gruntw="grunt && grunt watch"
