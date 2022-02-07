#!/bin/sh

INTERFACE=${RPI_INTERFACE}
ifconfig ${INTERFACE} 10.74.85.1/24
ifconfig ${INTERFACE} 10.74.85.1 netmask 255.255.255.0

if [ -e /rpi/rpi_macs.json ] ; then 
	cat /rpi/rpi_macs.json | \
	jq -r '.Inventory[] | "host \(.tag) { hardware ethernet \(.mac) ; fixed-address \(.ip) ; } " ' \
       	>> /etc/dhcp/dhcpd.conf
fi

dhcpd -user dhcp -group dhcp ${INTERFACE}

/usr/sbin/in.tftpd -R 4096:32767 -s /var/tftpboot/

