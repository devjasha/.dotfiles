#!/bin/bash

# Monitor switching script for Hyprland
# Automatically switches between external monitor (DP-2) and built-in laptop monitor (eDP-1)

EXTERNAL_MONITOR="DP-2"
INTERNAL_MONITOR="eDP-1"

# Check if external monitor is connected
if hyprctl monitors | grep -q "$EXTERNAL_MONITOR"; then
    # External monitor is connected - use only external monitor
    hyprctl keyword monitor "$EXTERNAL_MONITOR,2560x1440@144,0x0,1.25"

    # Set external monitor as primary
    xrandr --output "$EXTERNAL_MONITOR" --primary 2>/dev/null || true

    # Move all workspaces from internal to external monitor
    # Move workspaces 1-10 to ensure all are accessible on the external monitor
    for workspace_id in {1..10}; do
        hyprctl dispatch moveworkspacetomonitor "$workspace_id" "$EXTERNAL_MONITOR" 2>/dev/null
    done
    echo "Moved all workspaces to $EXTERNAL_MONITOR"

    # Disable internal monitor after moving workspaces
    hyprctl keyword monitor "$INTERNAL_MONITOR,disable"
    echo "Switched to external monitor ($EXTERNAL_MONITOR) and set as primary"
else
    # External monitor is not connected - use internal monitor
    hyprctl keyword monitor "$INTERNAL_MONITOR,preferred,auto,1.25"

    # Set internal monitor as primary
    xrandr --output "$INTERNAL_MONITOR" --primary 2>/dev/null || true

    echo "Switched to internal monitor ($INTERNAL_MONITOR)"
fi
