#!/bin/bash


if [ ! -f data_zimbra_dev.vdi ] ;  then
  /opt/VirtualBox/VBoxManage clonemedium ~/base_data_zimbra-build.vdi data_zimbra-build.vdi
else
	echo "data_zimbra-build.vdi already exists"
fi


