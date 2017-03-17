#!/bin/bash

echo "hello vagrant world"

echo zimbra 8.7.1 - jdk7 is mandatory

export JAVA_HOME=/usr/lib/jvm/java-7-oracle

sudo update-alternatives --set java /usr/lib/jvm/java-7-oracle/bin/java

java -version

if ( ! mount | grep -q \/data ) ; then
   sudo mount /dev/sdb1 /data
else
   echo /data mounted
fi


echo zimbra foss monolith tree \(8.7.1\)


cd /data/build
[ -d my-zimbra ] || git clone https://github.com/hernad/my-zimbra.git
cd my-zimbra

[ -d my-zimbra ] || exit 1

sudo rm -rf *
sudo chown vagrant -R .git
git checkout -f
git pull

cd ZimbraBuild
./buildZCS.sh
