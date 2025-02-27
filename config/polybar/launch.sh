#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

## Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

## Launch

## Left bar
polybar log -c ~/.config/polybar/current.ini &
polybar ip-adress -c ~/.config/polybar/current.ini &
polybar vpn-adress -c ~/.config/polybar/current.ini &
polybar hour -c ~/.config/polybar/current.ini &
polybar weather -c ~/.config/polybar/current.ini &

## Right ba
polybar target -c ~/.config/polybar/current.ini &
polybar primary -c ~/.config/polybar/current.ini &

## Center bar
polybar primary -c ~/.config/polybar/workspace.ini &
