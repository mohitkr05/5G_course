#! /bin/bash
# Installing Open5Gs - 5G in a Box
apt-get -y update
apt-get install -y gnupg wget tcpdump 

add-apt-repository ppa:open5gs/latest
apt-get install -y software-properties-common
apt-get -y update
apt install -y open5gs
#sudo apt install libc6=2.31-0ubuntu9.2 libc-bin=2.31-0ubuntu9.2 - To be used if getting error for nodejs
# curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
# sudo apt install -y nodejs
# mkdir -p /usr/lib/node_modules/open5gs
# sudo curl -fsSL https://open5gs.org/open5gs/assets/webui/install | sudo -E bash -
# sudo cp /home/vagrant/data/open5gs_webui.service /lib/systemd/system/open5gs-webui.service
sudo systemctl daemon-reload
sudo systemctl stop open5gs-*
sudo systemctl start open5gs-upfd