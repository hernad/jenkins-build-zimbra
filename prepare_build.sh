#!/bin/bash

VDI=data_zimbra-build-2.vdi
 
if [ ! -f $VDI ] ;  then
  /opt/VirtualBox/VBoxManage clonemedium ~/base_$VDI $VDI
else
	echo "$VDI already exists"
fi


