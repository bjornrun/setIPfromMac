#!/bin/sh

IFACE=tap0
IP_TEMPL="10.1.1.%d\n"
NETMASK="255.255.255.252"
BROADCASTMASK=3

HEXNUM4MAC=$(grep -oE "[^:]+$" /sys/class/net/$IFACE/address)
NUM4MAC=$(printf "%d\n" 0x$HEXNUM4MAC)


BROADCASTADDR=$(($NUM4MAC | $BROADCASTMASK))

NEWBROADCAST=$(printf $IP_TEMPL $BROADCASTADDR) 
NEWIP=$(printf $IP_TEMPL $NUM4MAC)
ifconfig $IFACE $NEWIP netmask $NETMASK broadcast $NEWBROADCAST
 