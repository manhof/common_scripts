#!/bin/bash
mount_dir=$1
sgdisk --largest-new=1 /dev/vdb 
mkfs.xfs /dev/vdb1
mkdir /mnt/cockroach
mount -t xfs /dev/vdb1 $mount_dir
echo "/dev/vdb1 $mount_dir xfs defaults 0 0" >> /etc/fstab
echo "Storage has been added to system on $mount_dir" >> /home/test