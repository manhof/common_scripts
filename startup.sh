#!/bin/bash
hostname=$1
pub=$2
echo 'Your Public IP Address is '$pub > /home/test
gawk -F= '/^ID=/{print $2}' /etc/os-release > /home/id.txt
serverbuild=$(cat /home/id.txt)
echo " This is the Server Build: " $serverbuild >> /home/test
if [[ $serverbuild == *"ubuntu"* ]]
 then
	apt-get update &> /dev/null
	apt-get upgrade -y &> /dev/null 
	apt-get install unzip -y
	apt-get install tcpdump -y
	apt-get install traceroute -y
	apt-get install pwgen -y
	echo "127.0.0.1    $hostname" >> /etc/hosts
	#apt-get upgrade -y
	#apt-get dist-upgrade -y
elif [[ $serverbuild == *"centos"* ]]
 then
    yum install epel-release -y
    yum install dnf -y
	dnf install unzip -y
	dnf install tcpdump -y
	dnf install traceroute -y 
	dnf install pwgen -y
	dnf update -y
else
       echo "Cannot determine Build Type... Exiting" >> /home/test
	   exit 3
fi	   
