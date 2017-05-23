#!/bin/bash
serverbuild= gawk -F= '/^ID=/{print $2}' /etc/os-release
#Certs need to .cer pem files which will be converted to .crt pem files
for var in "$@"
do	
	curl -O $var
done
echo "Downloaded Certs" >> /home/test
unzip '*.zip'
echo "Unziped Certs" >> /home/test
for f in *.cer 
do
	mv "$f" "$(basename "$f" .cer).crt"
done
echo "Converted Certs" >> /home/test
if [[ $serverbuild == *"ubuntu"* ]]
 then    
    mkdir /usr/local/share/ca-certificates/extra
    cp *.crt /usr/local/share/ca-certificates/extra/
    echo "Certs Copied" >> /home/test
    update-ca-certificates
    echo "Certs Updated" >> /home/test
elif [[ $serverbuild == *"centos"* ]]
 then
    cp *.crt /etc/pki/ca-trust/source/anchors/
    echo "certs copied" >> /home/test
    update-ca-trust check
    update-ca-trust enable
    update-ca-trust extract
    echo "CA updated" >> /home/test
else
       echo "Cannot determine Build Type... Exiting" >> /home/test
	   exit 3
fi	   