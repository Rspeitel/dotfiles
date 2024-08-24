#!/usr/bin/env bash

# TODO: Add some notes about this implementation
case $1 in
  --volume)
    pactl subscribe | grep --line-buffered "sink" | {
      volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{ print $5 }' | tr -d %)
      echo $volume
      while read -r event; do
        volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{ print $5 }' | tr -d %)
        echo $volume
      done
    }
  ;;
  --mute-status)
    pactl subscribe | grep --line-buffered "sink" | {
      mutestring=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{ print $2 }')
      if [[ $mutestring != 'no' ]]; 
        then echo false
        else echo true
      fi
      while read -r event; do
        mutestring=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{ print $2 }')
        if [[ $mutestring != 'no' ]]; 
          then echo false
          else echo true
        fi
      done
    }
  ;;
  --toggle-mute)
    pactl set-sink-mute @DEFAULT_SINK@ toggle
  ;;
  --set-volume)
    if [ -z "$2" ]; then
      echo "You need to provide a volume"
    else
      pactl set-sink-volume @DEFAULT_SINK@ $2%
    fi
  ;;
  --increase-volume)
    $(pactl set-sink-volume @DEFAULT_SINK@ +5%)
  ;;
  --decrease-volume)
    $(pactl set-sink-volume @DEFAULT_SINK@ -5%)
  ;;
  *)
    echo "Something went wrong with $1"
  ;;
esac
