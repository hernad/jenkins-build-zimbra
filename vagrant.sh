#!/bin/bash

echo "hello vagrant world"

echo zimbra 8.7.1 - jdk7 is mandatory

export JAVA_HOME=/usr/lib/jvm/java-7-oracle

#sudo update-alternatives --set java /usr/lib/jvm/java-7-oracle/bin/java

export PATH=/usr/lib/jvm/java-7-oracle/bin:$PATH

java -version

if ( ! mount | grep -q \/data ) ; then
   sudo mount /dev/sdb1 /data
else
   echo /data mounted
fi


echo zimbra foss monolith tree \(8.7.1\)


cd /data/build
[ -d my-zimbra ] || git clone https://github.com/hernad/my-zimbra.git

[ -d my-zimbra ] || exit 1

sudo chown vagrant -R my-zimbra
cd my-zimbra

git stash --include-untracked
git fetch --all
git clean -fdx
git reset --hard origin/bs_BA
git pull origin/bs_BA

./my-patches.sh

cd ZimbraBuild
./buildZCS.sh

cp amd64/zcs-8.7.1_GA_1671.UBUNTU16_64.*.tgz /vagrant/zcs.tar.gz

