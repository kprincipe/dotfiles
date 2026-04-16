#!/usr/bin/env bash

uptime_formatted=$(uptime | cut -d ',' -f1  | cut -d ' ' -f4,5)
# uptime_formatted=$(uptime | cut -d ',' -f1)

date_formatted=$(date "+%a %F (%H:%M)")

battery_status=$(cat /sys/class/power_supply/BAT0/status)
battery_percent=$(cat /sys/class/power_supply/BAT0/capacity)

muted=$(pactl get-sink-mute @DEFAULT_SINK@)
volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '\d+(?=%)' | head -n 1)

cpu_mode=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)

#pactl get-sink-volume alsa_output.pci-0000_00_1b.0.analog-stereo | cut -d '
#' -f1 | cut -d '/' -f2

wifi=$(iwlist wlp3s0 scan | grep ESSID)

echo "skrrrr | cpu mode: $cpu_mode ¦ volume: $volume% - $muted ¦ uptime: $uptime_formatted ¦ $battery_status $battery_percent% ¦ $date_formatted ¦"
