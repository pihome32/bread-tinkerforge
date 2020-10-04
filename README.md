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

run install.sh
reboot
Enable auto login
Enable I2c

In the file /etc/tinkerforge_mqtt.cmdline 
Add /home/pi/bread-tinkerforge/mqtt_init.json to the init file
sudo systemctl restart tinkerforge_mqtt
´´´
sudo nano /etc/pip.conf
add index-url=https://pypi.python.org/
python3 -m pip install raspberry-i2c-tb6612fng
´´´

Kiosk mode
´´´
sudo nano /etc/xdg/openbox/autostart
# Disable any form of screen saver / screen blanking / power management
xset s off
xset s noblank
xset -dpms

# Allow quitting the X server with CTRL-ATL-Backspace
setxkbmap -option terminate:ctrl_alt_bksp

# Start Chromium in kiosk mode
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' ~/.config/chromium/'Local State'
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/; s/"exit_type":"[^"]\+"/"exit_type":"Normal"/' ~/.config/chromium/Default/Preferences
chromium-browser --disable-infobars --kiosk 'http://localhost:1880/ui'
´´´

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
