# Installation steps for Open5GS & UERANSIM for single VM

## Open5GS


`sudo apt-get update`

`sudo apt-get install -y gnupg wget curl`

### Install MongoDB

`wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -`

`echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list`

`sudo apt update`

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

`sudo apt install make gcc g++ libsctp-dev lksctp-tools iproute2`

`sudo snap install cmake --classic`


## Notes

What is a netdev file

> systemd.netdev - Virtual Network Device configuration
A plain ini-style text file that encodes configuration about a

> The main Virtual Network Device file must have the extension .netdev; other extensions are ignored. 
Virtual network devices are created as soon as networkd is started. If a netdev with the  specified name already exists, networkd will use that as-is rather than create its own. Note that the settings of the
pre-existing netdev will not be changed by networkd.
 

