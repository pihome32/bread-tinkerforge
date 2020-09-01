#!/bin/bash
sudo apt-get update
sudo apt-get upgrade
sudo apt install -y  mosquitto-clients
sudo apt-get install pythonsudo apt-get install libusb-1.0-0 libudev0 pm-utils
wget https://download.tinkerforge.com/tools/brickd/linux/brickd_linux_latest_armhf.deb
sudo dpkg -i brickd_linux_latest_armhf.deb3-pip


curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo apt-get install -y libffi-dev libssl-dev
sudo apt-get install -y python3 python3-pip
sudo apt-get remove python-configparser
sudo pip3 -v install docker-compose
sudo usermod -aG docker pi
