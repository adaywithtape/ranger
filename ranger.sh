#!/bin/bash
#version kali rolling
#						TEH COLORZ :D
########################################################################
STD=$(echo -e "\e[0;0;0m")		#Revert fonts to standard colour/format
RED=$(echo -e "\e[1;31m")		#Alter fonts to red bold
GRN=$(echo -e "\e[1;32m")		#Alter fonts to green bold
BLU=$(echo -e "\e[1;36m")		#Alter fonts to blue bold
#
if [ -z $1 ] ; then IFACE=eth0 ; else IFACE=$1 ; fi
echo "+ Interface        : $IFACE"
#
IP=$(ifconfig $IFACE | grep "inet" | head -n 1 | awk '{print $2}')
echo "+ Local IP address : $IP"
#
RANGE=$(echo $IP | cut -d . -f 1-3)
IP_RANGE="$RANGE".0/24
#
echo "+ IP range to scan : $IP_RANGE"
echo "+ Host discovery   : netdiscover -i $IFACE -P -r $IP_RANGE"
netdiscover -i $IFACE -P -r $IP_RANGE
#
exit
