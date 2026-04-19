#!/usr/bin/env bash

output="all_lua.txt"
>"$output" # empty the file first

i=1

while IFS= read -r f; do
  echo "[$i] $f" >> "$output"
  cat "$f" >> "$output"
  echo "" >> "$output"
  ((i++))
done < <(find . -type f -name '*.lua' -print)
