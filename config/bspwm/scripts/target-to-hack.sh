#!/bin/bash

user="$(whoami)"
target_file="/home/${user}/.config/bin/target"

# Verificar si el archivo existe
if [ -f "$target_file" ]; then
    ip_address=$(awk '{print $1}' "$target_file")
    machine_name=$(awk '{print $2}' "$target_file")

    if [ -n "$ip_address" ] && [ -n "$machine_name" ]; then
        echo "%{F#e51d0b}󱩊 $ip_address%{u-} - $machine_name"
    else
        echo "%{F#e51d0b}󱩊 %{u-} No target"
    fi
else
    echo "%{F#e51d0b}󱩊 %{u-} No target file"
fi
