#!/bin/bash

VDI=data_zimbra-build-2.vdi
 
WORKSPACE=zimbra-build-2

if [ ! -f $VDI ] ; then

  VM=`VBoxManage list vms | grep ^\"${WORKSPACE}_default_ | tail -1 | awk '{print $2}'`
  if [ -n "$VM" ] ; then
    echo "erasing old VM $VM"
    VBoxManage unregistervm $VM --delete
  else
    echo "no old VM $WORKSPACE"
  fi

  HDD=`VBoxManage list hdds -l | grep "Location.*workspace/${WORKSPACE}/$VDI" -B7 | grep "^UUID:" | awk '{print $2}'`
  if [ -n "$HDD" ] ; then
     echo "erasing old HDD"
     VBoxManage closemedium $HDD --delete
  else
     echo "no old HDD ${WORKSPACE}/$VDI"
  fi

fi

if [ ! -f $VDI ] ;  then
  /opt/VirtualBox/VBoxManage clonemedium ~/base_$VDI $VDI
else
	echo "$VDI already exists"
fi


