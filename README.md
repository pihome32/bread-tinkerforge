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

* ./install.sh
* reboot
* raspi-config
* Disable display overscan
* Enable auto login and Enable I2c
* sudo vi /boot/config.txt dtoverlay=disable-bt


* In the file /etc/tinkerforge_mqtt.cmdline 
* Add /home/pi/bread-tinkerforge/mqtt_init.json to the init file
* sudo systemctl restart tinkerforge_mqtt

* sudo nano /etc/pip.conf
* add index-url=https://pypi.python.org/
* python3 -m pip install raspberry-i2c-tb6612fng
* enable project in node red settings

