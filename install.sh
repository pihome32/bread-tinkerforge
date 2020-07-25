#!/bin/bash
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install pythonsudo apt-get install libusb-1.0-0 libudev0 pm-utils
wget https://download.tinkerforge.com/tools/brickd/linux/brickd_linux_latest_armhf.deb
sudo dpkg -i brickd_linux_latest_armhf.deb3-pip
sudo apt install brickd
wget https://download.tinkerforge.com/apt/$(lsb_release -is | tr [A-Z] [a-z])/archive.key -q -O - | sudo apt-key add -
sudo sh -c "echo 'deb https://download.tinkerforge.com/apt/$(lsb_release -is | tr [A-Z] [a-z]) $(lsb_release -cs) main' > /etc/apt/sources.list.d/tinkerforge.list"
sudo apt update
sudo apt install python3-tinkerforge
sudo apt install tinkerforge-mqtt
