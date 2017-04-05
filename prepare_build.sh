#!/bin/bash

VDI=data_zimbra-build-2.vdi
 
if [ ! -f ] ;  then
  /opt/VirtualBox/VBoxManage clonemedium ~/base_data_zimbra-build-2.vdi $VDI
else
	echo "$VDI already exists"
fi


