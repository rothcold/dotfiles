#!/bin/bash
# Detect if secondary monitor is connected, if so, add a specific bar and move tray to it
# Else, keep tray on main monitor
# see https://github.com/polybar/polybar/issues/763

killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

outputs=$(xrandr --query | grep " connected" | cut -d" " -f1)
set -- $outputs
tray_output=$1

for m in $outputs; do
	if [ $m == $1 ] 
	then		
		MONITOR=$m TRAY_POSITION=right polybar --reload main -c ~/.config/polybar/config &	
		MONITOR=$m polybar --reload bottom -c ~/.config/polybar/config &	
	else
		MONITOR=$m TRAY_POSITION=none polybar --reload main -c ~/.config/polybar/config &
		MONITOR=$m polybar --reload bottom -c ~/.config/polybar/config &	
	fi
done

echo "Polybar launched..."
