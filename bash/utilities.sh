# brew install jq
# decodeJWT <JWT>
function decodeJWT {
  echo $1 | sed -e 's/.*\.\(.*\)\..*/\1/' | base64 -d | jq '.';
}

# brew install kqwait
# watch_file <file|dir> <command>
function watch_file() {
  file=$(echo $1);
  shift;
  while kqwait $file; do $@; done
}
