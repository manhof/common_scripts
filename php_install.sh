#!/bin/bash
#php install
serverbuild= gawk -F= '/^ID=/{print $2}' /etc/os-release
if [[ $serverbuild == *"ubuntu"* ]]
 then
	apt-get install software-properties-common -y 
    apt-get install php -y
    apt-get install libapache2-mod-php -y
    apt-get install php-mycrypt -y
    apt-get install php-mysql -y
    apt-get install php-mbstring -y
    apt-get install php-cgi -y
    apt-get install php-cli -y 
    apt-get install php-curl -y 
    apt-get install php-gd -y
    apt-get install php-ldap -y
    apt-get install php-json -y
    apt-get install php-opcache -y
    apt-get install php-readline -y
    apt-get install php-snmp -y 
    apt-get install php-xml -y
    apt-get install php-xmlrpc -y
    apt-get install php-zip -y 
	echo "php has been installed" >> /home/test
elif [[ $serverbuild == *"centos"* ]]
 then
	rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
	dnf --enablerepo=remi-php71 install php -y
	dnf --enablerepo=remi-php71 install php-pecl-apcu -y
	dnf --enablerepo=remi-php71 install php-pear -y
	dnf --enablerepo=remi-php71 install php-pdo -y 	
	dnf --enablerepo=remi-php71 install php-pgsql -y
	dnf --enablerepo=remi-php71 install php-cgi -y
	dnf --enablerepo=remi-php71 install php-cli -y
	dnf --enablerepo=remi-php71 install php-mysqlnd -y
	dnf --enablerepo=remi-php71 install php-mbstring -y
	dnf --enablerepo=remi-php71 install php-pecl-mongodb -y
	dnf --enablerepo=remi-php71 install php-pecl-memcache -y
	dnf --enablerepo=remi-php71 install php-pecl-memcached
	dnf --enablerepo=remi-php71 install php-gd -y
	dnf --enablerepo=remi-php71 install php-mcrypt -y
	dnf --enablerepo=remi-php71 install php-xml -y
	dnf --enablerepo=remi-php71 install php-readline -y
	dnf --enablerepo=remi-php71 install php-snmp -y 
	dnf --enablerepo=remi-php71 install php-zip -y
	dnf --enablerepo=remi-php71 install php-xmlrpc -y
	dnf --enablerepo=remi-php71 install php-json -y
	dnf --enablerepo=remi-php71 install php-ldap -y	
	echo "php has been installed" >> /home/test
else
       echo "Cannot determine Build Type... Exiting" >> /home/test
	   exit 3
fi	   