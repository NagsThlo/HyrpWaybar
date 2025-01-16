#!/bin/bash

get_volume() {
    pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1 | tr -d '%'
}

case $1 in
    increase)
        pactl set-sink-volume @DEFAULT_SINK@ +5%
        ;;
    decrease)
        pactl set-sink-volume @DEFAULT_SINK@ -5%
        ;;
    toggle-mute)
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        ;;
esac

volume=$(get_volume)
echo "{\"output\": \"$volume\"}"
