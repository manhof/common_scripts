#!/bin/bash
serverbuild= gawk -F= '/^ID=/{print $2}' /etc/os-release
if [ $serverbuild == *"ubuntu"* ]
 then
	apt-get update
    apt-get install ntp -y
    timedatectl set-ntp 1
	for var in "$@"
	do	
		echo "server $var iburst" >> /etc/ntp.conf
    done
	
    echo "NTP has been configured" >> /home/test
    systemctl restart ntp
    ntpq -p >> /home/test
elif [ $serverbuild == *"centos"* ]
 then
    dnf install chrony -y
	timedatectl set-ntp 1
	for var in "$@"
	do
		echo "server $var iburst" >> /etc/chrony.conf
    done
    systemctl start chronyd
	systemctl enable chronyd
    echo "NTP has been configured" >> /home/test
else
    echo "Cannot determine Build Type... Exiting" >> /home/test
	exit 3	
fi	   