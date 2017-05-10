#!/bin/bash


./prepare_build.sh

[ -f $TAR.tar.gz ] && rm $TAR.tar.gz

vagrant --version
vagrant up --provision
vagrant halt

ZIMBRA_VER=`cat ZIMBRA_VER`
TAR=zcs-zm-$ZIMBRA_VER.tar.gz

if [ ! -f $TAR ] ; then
   echo "$TAR not created ?!"
   exit 1
fi

ls -lh $TAR

