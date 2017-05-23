#!/bin/bash
hostname=$1
pub=$2
echo 'Your Public IP Address is '$pub > /home/test
serverbuild= gawk -F= '/^ID=/{print $2}' /etc/os-release
if [ $serverbuild == *"ubuntu"* ]
 then
	apt-get update
	apt-get install unzip -y
	apt-get install tcpdump -y
	apt-get install traceroute -y
	echo "127.0.0.1    $hostname" >> /etc/hosts
elif [ $serverbuild == *"centos"* ]
 then
    yum install epel-release -y
    yum install dnf -y
	dnf install unzip -y
	dnf install tcpdump -y
	dnf install traceroute -y
	dnf update -y
else
       echo "Cannot determine Build Type... Exiting" >> /home/test
	   exit 3
fi	   
