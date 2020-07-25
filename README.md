# bread-tinkerforge

## Chamber description

### Modes
#### Constant temperature with timer or not
#### Express bread fermentation
#### Sourdough fermentation with level input

#### Slow fermentation cycle
1. High temperature for a certain time 
1. Go down in temperature
1. Alarm
1. ...

#### Last bread fermentation with level input

#### Prepare the water in the correct temperature (depending the room temperature)
 
## Hardware
### Tinkerforge
#### Bricklets
* Ethernet
* Room temperature sensor : ??
* Distance IR sensor
* Chamber temperature sensor : ? ?
* Relay : ??
* E-paper screen
* Button : ??
#### Red-Brick
* Hdmi screen : ??

### Rapberry

```
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install pythonsudo apt-get install libusb-1.0-0 libudev0 pm-utils
wget https://download.tinkerforge.com/tools/brickd/linux/brickd_linux_latest_armhf.deb
sudo dpkg -i brickd_linux_latest_armhf.deb3-pip
sudo apt install brickd
wget https://download.tinkerforge.com/apt/$(lsb_release -is | tr [A-Z] [a-z])/archive.key -q -O - | sudo apt-key add -
sudo sh -c "echo 'deb https://download.tinkerforge.com/apt/$(lsb_release -is | tr [A-Z] [a-z]) $(lsb_release -cs) main' > /etc/apt/sources.list.d/tinkerforge.list"
sudo apt update
sudo apt install mosquitto mosquitto-clients
sudo systemctl enable mosquitto
sudo apt install python3-tinkerforge
sudo apt install tinkerforge-mqtt
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
 ```
 Modify the service : /lib/systemd/sytem/tinkerforge-mqtt.service
## Software
### Red-Brick
#### MQTT server
 
#### Flask for UI interface

#### PID control

#### Main program

### Raspberry


#### Node-Red

#### Influx DB

#### Grafana

#### Docker

### Communication RPI to Red-Brick
