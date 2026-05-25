#!/bin/bash
# PS2 Minimal - Thermal status without icons

temp_raw=$(cat /sys/class/thermal/thermal_zone0/temp)
temp=$((temp_raw / 1000))

if [ $temp -lt 45 ]; then
    class="blue"
elif [ $temp -lt 60 ]; then
    class="yellow"
elif [ $temp -lt 75 ]; then
    class="orange"
else
    class="red"
fi

# Only text + degree symbol
echo "{\"text\": \"$temp°\", \"tooltip\": \"Temperature: $temp°C\", \"class\": \"$class\"}"
