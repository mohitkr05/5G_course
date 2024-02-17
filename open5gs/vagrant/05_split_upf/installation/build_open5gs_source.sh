#! /bin/bash
# Installing Open5Gs - 5G in a Box
apt-get -y update
apt-get install -y gnupg wget tcpdump git 

### Install mongodb
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc > key.asc 
sudo apt-key add key.asc
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
apt-get -y update
apt install -y mongodb-org
sudo systemctl start mongod
sudo systemctl enable mongod


## Build Open5GS


sudo apt install -y python3-pip python3-setuptools python3-wheel ninja-build build-essential flex bison git cmake libsctp-dev libgnutls28-dev libgcrypt-dev libssl-dev libidn11-dev libmongoc-dev libbson-dev libyaml-dev libnghttp2-dev libmicrohttpd-dev libcurl4-gnutls-dev libnghttp2-dev libtins-dev libtalloc-dev meson
git clone https://github.com/open5gs/open5gs
cd open5gs


## Setup tunnel
sudo ./misc/netconf.sh


meson build --prefix=`pwd`/install
ninja -C build
cd build
ninja install
cd ../