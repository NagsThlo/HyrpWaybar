#!/bin/bash

# Fetch volume and mute status using wpctl
volume_info=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
mute=$(echo "$volume_info" | grep -o 'MUTED')
volume=$(echo "$volume_info" | grep -oP '\d+\.\d+')

# Convert the volume to a percentage
volume_percent=$(awk "BEGIN { printf(\"%.0f\", $volume * 100) }")

# Determine the appropriate ASCII icon
if [[ $mute == "MUTED" ]]; then
    icon="ZVUKA BLAT NETU NAHUI"
elif [[ $volume_percent -le 0 ]]; then
    icon="[x_________]"
elif [[ $volume_percent -le 10 ]]; then
    icon="[v_________]"
elif [[ $volume_percent -le 20 ]]; then
    icon="[_v________]"
elif [[ $volume_percent -le 30 ]]; then
    icon="[__v_______]"
elif [[ $volume_percent -le 40 ]]; then
    icon="[___v______]"
elif [[ $volume_percent -le 50 ]]; then
    icon="[____v_____]"
elif [[ $volume_percent -le 60 ]]; then
    icon="[_____v____]"
elif [[ $volume_percent -le 70 ]]; then
    icon="[______v___]"
elif [[ $volume_percent -le 80 ]]; then
    icon="[_______v__]"
elif [[ $volume_percent -le 90 ]]; then
    icon="[________v_]"
else
    icon="[_________v]"
fi

# Output the volume percentage and icon
echo "$icon $volume_percent%"
