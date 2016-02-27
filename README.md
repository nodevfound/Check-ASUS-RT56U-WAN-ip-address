# Check-ASUS-RT56U-WAN-ip-address
Only tested this script on ASUS RT56U wireless router running on stock firmware only

You  need to edit the WANIP variable below before running the script: 
1) username
2) password
3) ip address of your router (x.x.x.x)

WANIP=$(/usr/bin/curl --silent --user username:password http://x.x.x.x/device-map/internet.asp | grep -i "function wanlink_ipaddr() { return" | cut -d "'" -f2)
