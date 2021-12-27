function decodeJWT {
  echo $1 | sed -e 's/.*\.\(.*\)\..*/\1/' | base64 -d | jq '.';
}
