#!/bin/bash

# Get all sink IDs and names
readarray -t SINK_LINES < <(wpctl status | sed -n '/Audio/,/Video/p' | sed -n '/Sinks:/,/Sources:/p' | grep '[0-9]\+\.')

if [ ${#SINK_LINES[@]} -eq 0 ]; then
    notify-send "Audio Output" "No audio sinks found" -t 2000 -i audio-card
    exit 1
fi

# Get current default sink
CURRENT_DEFAULT=$(pactl get-default-sink)

# Parse sinks
SINK_IDS=()
SINK_NAMES=()
CURRENT_INDEX=-1

for i in "${!SINK_LINES[@]}"; do
    # Extract ID (remove leading spaces, asterisk, etc.)
    ID=$(echo "${SINK_LINES[$i]}" | sed 's/^[^0-9]*\([0-9]\+\)\..*/\1/')
    # Extract name (between the dot and the bracket)
    NAME=$(echo "${SINK_LINES[$i]}" | sed 's/^[^0-9]*[0-9]\+\.\s*\(.*\)\s*\[.*/\1/' | sed 's/\s*$//')

    SINK_IDS+=("$ID")
    SINK_NAMES+=("$NAME")

    # Check if this is the current default (note: grep node.name with any prefix)
    SINK_NODE_NAME=$(wpctl inspect "$ID" | grep -oP 'node\.name = "\K[^"]+')
    if [ "$SINK_NODE_NAME" == "$CURRENT_DEFAULT" ]; then
        CURRENT_INDEX=$i
    fi
done

# Calculate next index (cycle through sinks)
if [ $CURRENT_INDEX -eq -1 ]; then
    NEXT_INDEX=0
else
    NEXT_INDEX=$(( (CURRENT_INDEX + 1) % ${#SINK_IDS[@]} ))
fi

# Switch to next sink
wpctl set-default "${SINK_IDS[$NEXT_INDEX]}"

# Send notification
notify-send "Audio Output" "Switched to: ${SINK_NAMES[$NEXT_INDEX]}" -t 2000 -i audio-headphones

echo "Switched to: ${SINK_NAMES[$NEXT_INDEX]}"
