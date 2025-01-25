#!/usr/bin/env bash

while read -r choice; do

if [[ "$choice" -eq 1 ]]; then
  echo "choice is 1"
elif [[ "$choice" -eq 1 || "$choice" -eq 2 ]]; then
  echo " choice is 1 or 2"
fi
done
