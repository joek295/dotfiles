#!/bin/bash
case "$1" in
"speak") echo "$[100*`grep remaining /proc/acpi/battery/BAT1/state | awk {'print $3'}`/`grep full /proc/acpi/battery/BAT1/info | awk {'print $4'}`]%" | esddsp festival --tts -b;;
*) echo $[100*`grep remaining /proc/acpi/battery/BAT1/state | awk {'print $3'}`/`grep full /proc/acpi/battery/BAT1/info | awk {'print $4'}`] ;;
esac
