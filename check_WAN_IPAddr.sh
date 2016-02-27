#!/bin/bash

#Config file
WAN_FILE="wanip.config"
#Get current WAN ip address
WANIP=$(/usr/bin/curl --silent --user username:password http://x.x.x.x/device-map/internet.asp | grep -i "function wanlink_ipaddr() { return" | cut -d "'" -f2)
#Get old WAN ip address store in config file
OLD_WANIP=$(cat $WAN_FILE 2>&1)
#Get date and time
TIMESTAMP=$(/bin/date)

#echo $OLD_WANIP

if [[ -z $OLD_WANIP ]]; then
	echo $TIMESTAMP "@" $WANIP > $WAN_FILE

elif [[ $OLD_WANIP =~ "No such file or directory" ]]; then
	echo "File [" $WAN_FILE ] "not found"
	echo "Create [" $WAN_FILE  "]" 
	echo $TIMESTAMP "@" $WANIP > $WAN_FILE

elif [[ $OLD_WANIP =~ $WANIP ]]; then
	echo $TIMESTAMP "@" $WANIP > $WAN_FILE
	echo "Same WAN IP"

elif [[ ! $OLD_WANIP =~ $WANIP ]]; then
	echo $TIMESTAMP "@" $WANIP > $WAN_FILE
        echo "WAN IP renew!"
fi
