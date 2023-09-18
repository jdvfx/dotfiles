#!/bin/bash
#
# The Sway configuration file in ~/.config/sway/config calls this script.
# You should see changes to the status bar after saving this script.
# If not, do "killall swaybar" and $mod+Shift+c to reload the configuration.

# Produces "21 days", for example
# uptime_formatted=$(uptime | cut -d ',' -f1  | cut -d ' ' -f4,5)
# upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | awk '{print $2}'
# The abbreviated weekday (e.g., "Sat"), followed by the ISO-formatted date
# like 2018-10-06 and the time (e.g., 14:01)
date_formatted=$(date "+%a %d/%m/%Y . %H:%M")

# Get the Linux version but remove the "-1-ARCH" part
# linux_version=$(uname -r | cut -d '-' -f1)

battery=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | awk '{print $2}')
cpu_temp=$(sensors| grep CPU | cut -d + -f2)

fan1=$(cat /proc/acpi/ibm/fan | grep level: | awk '{print $2}')
fan2=$(sensors| grep fan2 | awk '{print $2}')
# Emojis and characters for the status bar
# 💎 💻 💡 🔌 ⚡ 📁 \|
# echo $uptime_formatted ↑ $linux_version 🐧 $battery_status 🔋 $date_formatted

echo $fan1:$fan2 . $cpu_temp . $battery . $date_formatted 


