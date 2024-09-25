#!/bin/bash

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

# backlight
function backlight() {
	if [[ $1 -lt 10 ]]; then
		xrandr --output eDP-1 --brightness "0.$1"
	else
		echo "No greater than 10, dumbass"
	fi
}

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

function monitor() {
	if [ $1 -eq '1' ]; then
		xrandr --output HDMI-1 --off
	elif [ $1 -eq '2' ]; then
		xrandr --output eDP-1 --mode 1920x1080
		xrandr --output HDMI-1 --mode 1360x768 --right-of eDP-1
	fi
}
