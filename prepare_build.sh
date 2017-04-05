#!/bin/bash


if [ ! -f data_zimbra_dev.vdi ] ;  then
  /opt/VirtualBox/VBoxManage clonemedium ~/base_data_zimbra-build-2.vdi data_zimbra-build-2.vdi
else
	echo "data_zimbra-build-2.vdi already exists"
fi


