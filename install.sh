#!/bin/bash
sudo apt-get update
sudo apt-get upgrade
sudo apt install -y  mosquitto-clients
sudo apt-get install pythonsudo apt-get install libusb-1.0-0 libudev0 pm-utils
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
sudo apt install brickd
sudo apt install tinkerforge-mqtt

bash <(curl -sL https://raw.githubusercontent.com/node-red/linux-installers/master/deb/update-nodejs-and-nodered)
sudo systemctl enable nodered.service
sudo systemctl start nodered.service
echo "deb https://packages.grafana.com/oss/deb stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
sudo apt-get update
sudo apt-get install -y grafana
sudo /bin/systemctl enable grafana-server
sudo /bin/systemctl start grafana-server

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo apt-get install -y libffi-dev libssl-dev
sudo apt-get install -y python3 python3-pip
sudo apt-get remove python-configparser
sudo pip3 -v install docker-compose
sudo usermod -aG docker pi
sudo apt-get install sqlite3