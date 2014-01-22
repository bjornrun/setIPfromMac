#!/bin/bash

IFACE=eth0
IP_TEMPL="10.10.61.%d\n"
NETMASK="255.255.255.252"
BROADCASTMASK=3
IPDELTA2GW=-1

HEXNUM4MAC=$(grep -oE "[^:]+$" /sys/class/net/$IFACE/address)
NUM4MAC=$(printf "%d\n" 0x$HEXNUM4MAC)

BROADCASTADDR=$(($NUM4MAC | $BROADCASTMASK))
NEWBROADCAST=$(printf $IP_TEMPL $BROADCASTADDR) 
NEWIP=$(printf $IP_TEMPL $NUM4MAC)
GWIP=$(printf $IP_TEMPL $(($NUM4MAC + $IPDELTA2GW)))

ifconfig $IFACE $NEWIP netmask $NETMASK broadcast $NEWBROADCAST

ifconfig lo up

route add default gw $GWIP

