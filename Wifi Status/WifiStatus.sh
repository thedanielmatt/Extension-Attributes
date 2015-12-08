#!/bin/bash
set -x
interface=$(networksetup -listallhardwareports | grep -A1 'Wi-Fi' | grep "Device" | awk '{print $2}';)

status=$(networksetup -getairportnetwork "$interface" |tail -n1)

if [[ "$status" == "Wi-Fi power is currently off." ]];
then
    echo "<result>Off</result>"
else
	currentNetwork=$(networksetup -getairportnetwork en0)
	curSSID=$(awk '{print $4 $5 $6}' <<< "$currentNetwork")
	echo "<result>"$curSSID"</result>"
fi


