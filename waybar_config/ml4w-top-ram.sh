#!/bin/bash
# PS2 Minimal - Top RAM App Monitor

# Get the process name and %mem of the top memory consumer
top_process=$(ps -eo comm,%mem --sort=-%mem | head -n 2 | tail -n 1)
app_name=$(echo "$top_process" | awk '{print $1}')
mem_percent=$(echo "$top_process" | awk '{print $2}')

# Clean up common long names
case "$app_name" in
    "electron") app_name="Electron" ;;
    "firefox") app_name="Firefox" ;;
    "chrome"|"google-chrome") app_name="Chrome" ;;
    "brave") app_name="Brave" ;;
    "web-content") app_name="Firefox Tab" ;;
esac

echo "{\"text\": \"󰍛 $app_name\", \"tooltip\": \"Top RAM: $app_name ($mem_percent%)\", \"class\": \"topram\"}"
