#!/bin/bash

PLATFORM="Thinkpad"

# platform agnostic:
#
# date / time
date_formatted=$(date "+%a.%d.%b.%Y %H:%M")
# ---------- CPU average usage ---------
cpu=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')

# platform specific:
#
if [ "$PLATFORM" == "Thinkpad" ]
then
	# thinkpad
	battery=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | awk '{print $2}')

	cpu_temp=$(sensors| grep CPU | cut -d + -f2)
	fan1=$(cat /proc/acpi/ibm/fan | grep level: | awk '{print $2}')
	fan2=$(sensors| grep fan2 | awk '{print $2}')

	echo $fan1:$fan2 . $cpu . $cpu_temp . $battery . $date_formatted 
else
	# macbook pro
	fan1=$(sensors | grep side | awk '{print $4}' | xargs | awk '{print $1}')
	fan2=$(sensors | grep side | awk '{print $4}' | xargs | awk '{print $2}')
	cpu_temp=$(sensors | grep "Core 0" | awk '{print $3}')

	echo $fan1:$fan2 . $cpu . $cpu_temp . $date_formatted 

fi

