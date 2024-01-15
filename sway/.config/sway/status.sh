#!/bin/bash
date_formatted=$(date "+%a.%d.%b.%Y %H:%M")

# only care about that for Thinkpad
# battery=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | awk '{print $2}')

# ---------- CPU average usage ---------
cpu=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')

# ---------- CPU temp ---------
# Thinkpad
# cpu_temp=$(sensors| grep CPU | cut -d + -f2)

# Macbook pro
cpu_temp=$(sensors | grep "Core 0" | awk '{print $3}')


# ---------- FANS ---------

# Thinkpad
# fan1=$(cat /proc/acpi/ibm/fan | grep level: | awk '{print $2}')
# fan2=$(sensors| grep fan2 | awk '{print $2}')

# macbook pro
fan1=$(sensors | grep side | awk '{print $4}' | xargs | awk '{print $1}')
fan2=$(sensors | grep side | awk '{print $4}' | xargs | awk '{print $2}')

# STATUS BAR: Thinkpad
# echo $fan1:$fan2 . $cpu_temp . $battery . $date_formatted 

# STATUS BAR: Macbook pro
echo $fan1:$fan2 . $cpu . $cpu_temp . $date_formatted 


