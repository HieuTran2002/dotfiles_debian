#!/bin/bash

# auto run

function timeleft() {
	#!/bin/bash
	# Get the current time in seconds since epoch
	current_time=$(date +%s)

	# Get the time at midnight in seconds since epoch
	midnight_time=$(date -d "tomorrow 00:00:00" +%s)

	# Calculate the difference between the two times in seconds
	time_diff=$((midnight_time - current_time))

	# Convert the time difference to hours and minutes
	hours=$((time_diff / 3600))
	minutes=$(((time_diff % 3600) / 60))

	# Print the time left until midnight
	RED='\033[0;32m'
	NOCOLOR='\033[0m'
	BOLD=$(tput bold)
	NORMAL=$(tput sgr0)
	echo "${RED}${BOLD}$hours : $minutes h ${NOCOLOR}${NORMAL} left."
}

timeleft

function imvs() {
	imv -t 1 "$1" $(ls "$(dirname "$1")" | sort -n)
}

# mute / unmute
function mute() {
	amixer set Master mute
}

function unmute() {
	amixer set Master unmute
}

# better clear
function cl() {
	clear
	task
	timeleft
}

# backlight
function backlight() {
	if [[ $1 -lt 10 ]]; then
		xrandr --output eDP-1 --brightness "0.$1"
	else
		echo "No greater than 10, dumbass"
	fi
}

# function backlight()
# {
#
#     local id = ""
#     if [ "$1" == "1" ]; then
#         id = "eDP-1"
#     elif [ "$1" == "2"]; then
#         id = "HDMI-1"
#     fi
#
#     if [[ $2 -lt 10 ]]
#     then
#         xrandr --output "$id" --brightness "0.$1"
#     else
#         echo "No greater than 10, dumbass"
#     fi
# }
function backlight2() {
	if [[ $1 -lt 10 ]]; then
		xrandr --output HDMI-1 --brightness "0.$1"
	else
		echo "No greater than 10, dumbass"
	fi
}

# bluetooth control

function blue-reset {
	timeout 5 bluetoothctl remove $HEADSET
	timeout 5 bluetoothctl scan on
	bluetoothctl trust $HEADSET
	bluetoothctl pair $HEADSET

}

function blue-connect {

	# mute
	bluetoothctl connect $HEADSET

	# if no connection, wait
	pactl list short sinks | grep -i "bluez" | awk '{print $1}'
	echo "Volume adjusting"
	sleep 1
	pactl -- set-sink-volume $(pactl list short sinks | grep -i "bluez" | awk '{print $1}') 20%

	# unmute

	echo "Done"
}

function blue-disconnect {
	bluetoothctl disconnect
}

# get path
function yy {
	echo $(pwd) | xclip -sel clip
}

# utils with grep
function lsgrep() {
	ls | grep -i "$1"
}

function lswcgrep() {
	ls | grep -i "$1" | wc -l
}

function monitor() {
	if [ $1 -eq '1' ]; then
		xrandr --output HDMI-1 --off
	elif [ $1 -eq '2' ]; then
		xrandr --output eDP-1 --mode 1920x1080
		xrandr --output HDMI-1 --mode 1360x768 --right-of eDP-1
	fi
}
