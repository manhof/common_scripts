#!/bin/bash
#apache install
gawk -F= '/^ID=/{print $2}' /etc/os-release > /home/id.txt
serverbuild=$(cat /home/id.txt)
if [[ $serverbuild == *"ubuntu"* ]]
 then
	add-apt-repository ppa:ondrej/apache2
	apt update -y
	apt install apache2
	echo "apache2 has been installed" >> /home/test
elif [[ $serverbuild == *"centos"* ]]
 then
	dnf install httpd -y
	dnf install mod_ssl -y
	echo "apache2 has been installed" >> /home/test
else
    echo "Cannot determine Build Type... Exiting" >> /home/test
	exit 3
fi	   
