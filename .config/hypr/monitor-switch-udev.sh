#!/bin/bash

# Wrapper script for udev to trigger monitor switching
# This runs as root via udev, so we need to execute as the correct user

USER="bwardsen"
HYPR_INSTANCE_SIGNATURE=$(ls -t /tmp/hypr/*/hyprland.lock 2>/dev/null | head -1 | sed 's/\/hyprland\.lock$//' | xargs basename 2>/dev/null)

# Wait a moment for the display to settle
sleep 1

# Execute the monitor switch script as the user with the correct Hyprland instance
if [ -n "$HYPR_INSTANCE_SIGNATURE" ]; then
    export HYPRLAND_INSTANCE_SIGNATURE="$HYPR_INSTANCE_SIGNATURE"
    su "$USER" -c "HYPRLAND_INSTANCE_SIGNATURE=$HYPR_INSTANCE_SIGNATURE /home/$USER/.config/hypr/monitor-switch.sh" >> /tmp/monitor-switch-udev.log 2>&1
else
    echo "$(date): No Hyprland instance found" >> /tmp/monitor-switch-udev.log
fi
