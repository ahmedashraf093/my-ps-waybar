#!/bin/bash
BATTERY=$(upower -e | grep battery | head -n 1)
percentage=$(upower -i "$BATTERY" | grep percentage | awk '{print $2}')
state=$(upower -i "$BATTERY" | grep state | awk '{print $2}')

if [ "$state" == "charging" ] || [ "$state" == "fully-charged" ]; then
    class="charging"
    icon="󱐋 " # Charging icon
else
    class="discharging"
    icon="" # No icon when discharging
fi

echo "{\"text\": \"$icon$percentage\", \"class\": \"$class\", \"tooltip\": \"Status: $state\"}"
