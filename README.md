setIPfromMac
============

Set the IP address according to MAC address. The last byte of the MAC address is used.

**Usage:**
	Run this script as root during startup. 

*Configure by setting the following parameters:*

* IFACE = The interface to configure. Example: eth0
* IP_TEMPL = The template used to set ip address. Remember to add \n at the end. Example: "10.1.1.%d\n"
* NETMASK = The netmask used for the interface. Example: For a 30 bit netmask -> 255.255.255.252
* BROADCASTMASK = The broadcast address used. Example: For a 30 bit netmask -> 3 (it will set the last two bits to 1)

**Use cases:**
	Multiple virtual machines using a copy of the same rootfs that needs a specific IP address without using a DHCP server.

**Limitations:**
	Handles maximum a C net (24 bit netmask)
