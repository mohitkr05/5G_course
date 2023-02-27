#! /bin/bash
# Installing UERANSIM - gNB & UE in a Box
apt-get -y update
apt-get install -y gnupg wget tcpdump make gcc g++ libsctp-dev lksctp-tools iproute2 git
snap install cmake --classic
cd /home/vagrant/UERANSIM
rm -fr .git
git init
git remote add origin https://github.com/aligungr/UERANSIM
git fetch 
git reset --hard origin/master
ls
pwd
cd /home/vagrant/UERANSIM/
make