alias ll="ls -la"

rmd() {
   pandoc $1 | lynx -stdin
}

updateMergeBase () {
   MERGE_BASE=$(git merge-base $(git rev-parse --abbrev-ref --symbolic-full-name @{u}) $(git rev-parse --abbrev-ref HEAD))
}

safeRebase() {
   updateMergeBase
   git rebase -i ${MERGE_BASE}
}

alias gruntw="grunt && grunt watch"
