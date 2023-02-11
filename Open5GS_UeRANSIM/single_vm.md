# Installation steps for Open5GS & UERANSIM for single VM

## Open5GS


`sudo apt-get update`

`sudo apt-get install -y gnupg wget curl`

### Install MongoDB

`wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -`

`echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list`

`sudo apt update`


> Failing installation of Mongodb?  Follow this
https://askubuntu.com/questions/1403619/mongodb-install-fails-on-ubuntu-22-04-depends-on-libssl1-1-but-it-is-not-insta


MongoDB 6.0 is now installable from mongodb repositories on Jammy, without requiring libssl1.1
Original answer

MongoDb has no official build for ubuntu 22.04 at the moment.

Ubuntu 22.04 has upgraded libssl to 3 and does not propose libssl1.1

You can force the installation of libssl1.1 by adding the ubuntu 20.04 source:

`echo "deb http://security.ubuntu.com/ubuntu focal-security main" | sudo tee /etc/apt/sources.list.d/focal-security.list`

`sudo apt-get update && sudo apt-get install libssl1.1`


Then delete the focal-security list file you just created:

`sudo rm /etc/apt/sources.list.d/focal-security.list`



`apt install -y mongodb-org mongodb-org-database`

`systemctl start mongod`

`systemctl enable mongod`



### Install NodeJs

`curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -`

`sudo apt install nodejs`


### Install Open5GS

`add-apt-repository ppa:open5gs/latest`

`apt-get install -y software-properties-common`

`apt-get -y update && apt install -y open5gs`


### Install the webui

`curl -fsSL https://open5gs.org/open5gs/assets/webui/install | sudo -E bash -`


## UERANSIM

`sudo apt install make gcc g++ libsctp-dev lksctp-tools iproute2 git`

`sudo snap install cmake --classic`

`git clone https://github.com/aligungr/UERANSIM`


`cd ~/UERANSIM`

`make`

## Notes

What is a netdev file

> systemd.netdev - Virtual Network Device configuration
A plain ini-style text file that encodes configuration about a

> The main Virtual Network Device file must have the extension .netdev; other extensions are ignored. 
Virtual network devices are created as soon as networkd is started. If a netdev with the  specified name already exists, networkd will use that as-is rather than create its own. Note that the settings of the
pre-existing netdev will not be changed by networkd.
 

