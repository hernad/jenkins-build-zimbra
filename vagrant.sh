#!/bin/bash


sudo apt-get update -y
sudo apt-get install software-properties-common openjdk-8-jdk ant ruby git maven build-essential -y

if ( ! mount | grep -q \/data ) ; then
   sudo mount /dev/sdb1 /data
else
   echo /data mounted
fi



[ -d /data/build ] || sudo mkdir -p /data/build
sudo chown vagrant /data/build 

cd /data/build
mkdir installer-build
cd installer-build

rm -rf BUILDS/UBUNTU16_64

[ -d zm-build ] || git clone https://github.com/Zimbra/zm-build.git
[ -d zm-build ] || exit 1
sudo chown vagrant -R zm-build

cd zm-build
git checkout develop -f
git pull


#git stash --include-untracked
#git fetch --all
#git reset --hard origin/bs_BA
#git checkout bs_BA
#git pull


./build.pl --build-no=1713 --build-ts=`date +'%Y%m%d%H%M%S'` \
  --build-release=JUDASPRIEST --build-release-no=8.7.6 \
  --build-release-candidate=GA --build-type=FOSS \
  --build-thirdparty-server=files.zimbra.com --no-interactive


cd ..

cp -av BUILDS/UBUNTU16_64/JUDASPRIEST-876/*_FOSS/zm-build/zcs-8.7.6_1713.UBUNTU16_64.*.tgz /vagrant/zcs-zm.tar.gz


