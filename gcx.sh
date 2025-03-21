#!/bin/bash

gcx() {
  # TODO
}

gax() {
  if [ $# -lt 1 ]; then
    echo "(ERROR) Correct usage: gax <filesnippet>"
    return 1
  fi

  files=($(git status --porcelain | awk '{print $2}'))
  matches=($(printf "%s\n" "${files[@]}" | grep -i "$1"))

  if [ ${#matches[@]} -eq 0 ]; then
    echo "No matches"
    return 1
  elif [ ${#matches[@]} -eq 1 ]; then
    msg="Added ${matches[1]}"
  else
    msg="Added: ${#matches[@]} files"
  fi

  git add "${matches[@]}"
  echo $msg
}
