#!/bin/bash

case $1 in
  --workspaces)
    echo 1
    swaymsg -t subscribe "['workspace']" --monitor | {
        while read -r event; do
          echo $event | jq '.current.name | tonumber'
        done
    }
  ;;
  --change-workspace)
    if [ -z "$2" ]; then
      echo "You need to provide a workspace"
    else
      swaymsg workspace $2
    fi
  ;;
esac
