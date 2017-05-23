#!/bin/bash
serverbuild= gawk -F= '/^ID=/{print $2}' /etc/os-release
if [ $serverbuild == *"ubuntu"* ]
 then
	sysctl -w net.ipv4.tcp_timestamps=0
elif [ $serverbuild == *"centos"* ]
 then
	echo "0" > /proc/sys/net/ipv4/tcp_timestamps
else
	echo "Cannot determine Build Type... Exiting" >> /home/test
	exit 3
fi  
echo "# Disable TCP Timestamps" >> /etc/sysctl.conf
echo "net.ipv4.tcp_timestamps=0" >> /etc/sysctl.conf
echo "security hardening complete" >> /home/test