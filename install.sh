#!/bin/bash
sudo apt-get update

sudo apt install -y  mosquitto-clients
sudo apt-get install pythonsudo apt-get install libusb-1.0-0 libudev0 pm-utils

wget https://download.tinkerforge.com/apt/$(lsb_release -is | tr [A-Z] [a-z])/archive.key -q -O - | sudo apt-key add -
sudo sh -c "echo 'deb https://download.tinkerforge.com/apt/$(lsb_release -is | tr [A-Z] [a-z]) $(lsb_release -cs) main' > /etc/apt/sources.list.d/tinkerforge.list"
sudo apt-get update
sudo apt install brickd
sudo apt install tinkerforge-mqtt

bash <(curl -sL https://raw.githubusercontent.com/node-red/linux-installers/master/deb/update-nodejs-and-nodered)
sudo systemctl enable nodered.service
sudo systemctl start nodered.service


sudo apt install python3-tinkerforge



sudo apt-get install -y libffi-dev libssl-dev
sudo apt-get install -y python3 python3-pip
sudo apt-get remove python-configparser

sudo systemctl disable hciuart.service
sudo systemctl disable bluealsa.service
sudo systemctl disable bluetooth.service
sudo apt-get purge bluez -y
sudo apt-get autoremove -y

sudo apt install mosquitto mosquitto-clients
sudo systemctl enable mosquitto

sudo apt-get install xdotool unclutter sed

sudo apt-get install --no-install-recommends chromium-browser

sudo apt-get install libusb-1.0-0 libudev1 procps
wget --backups=1 https://download.tinkerforge.com/tools/brickd/linux/brickd_linux_latest_armhf.deb
sudo dpkg -i brickd_linux_latest_armhf.deb
