#!/bin/bash

# Lid switch handler for Hyprland
# Handles laptop lid open/close events for clamshell mode

EXTERNAL_MONITOR="DP-2"
INTERNAL_MONITOR="eDP-1"

case "$1" in
    open)
        echo "Lid opened"
        # Check if external monitor is connected
        if hyprctl monitors | grep -q "$EXTERNAL_MONITOR"; then
            # External monitor connected - keep it as primary, enable internal as secondary
            hyprctl keyword monitor "$INTERNAL_MONITOR,preferred,auto,1.25"
            echo "Enabled internal monitor as secondary"
        else
            # No external monitor - enable internal monitor
            hyprctl keyword monitor "$INTERNAL_MONITOR,preferred,auto,1.25"
            xrandr --output "$INTERNAL_MONITOR" --primary 2>/dev/null || true
            echo "Enabled internal monitor as primary"
        fi
        ;;
    close)
        echo "Lid closed"
        # Check if external monitor is connected
        if hyprctl monitors | grep -q "$EXTERNAL_MONITOR"; then
            # External monitor connected - disable internal monitor for clamshell mode
            # Move all workspaces to external monitor first
            for workspace_id in {1..10}; do
                hyprctl dispatch moveworkspacetomonitor "$workspace_id" "$EXTERNAL_MONITOR" 2>/dev/null
            done
            hyprctl keyword monitor "$INTERNAL_MONITOR,disable"
            echo "Clamshell mode: disabled internal monitor, workspaces on external monitor"
        else
            # No external monitor - keep internal monitor on (don't disable it)
            echo "No external monitor detected, keeping internal monitor enabled"
        fi
        ;;
    *)
        echo "Usage: $0 {open|close}"
        exit 1
        ;;
esac
