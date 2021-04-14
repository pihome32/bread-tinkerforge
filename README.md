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

#### Display
* sudo touch /etc/systemd/system/dashboard.service
* sudo nano /etc/systemd/system/dashboard.service
```
[Unit]
Description=Chromium Dashboard
Requires=graphical.target
After=graphical.target

[Service]
Environment=DISPLAY=:0.0
Environment=XAUTHORITY=/home/pi/.Xauthority
Type=simple
ExecStart=sudo /home/pi/bread-tinkerforge/dashboard.sh
Restart=on-abort
User=pi
Group=pi

[Install]
WantedBy=graphical.target
```
* chmod +x dashboard.sh
* systemctl enable dashboard.service

* sudo nano /etc/xdg/openbox/autostart
```console
xset -dpms			# turn off display power management system
xset s noblank		# turn off screen blanking
# Remove exit errors from the config files that could trigger a warning
  
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' ~/.config/chromium/'Local State'
  
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/; s/"exit_type":"[^"]\+"/"exit_type":"Normal"/' ~/.config/chromium/Default/Preferences
# Run Chromium in kiosk mode
chromium

-browser  --noerrdialogs --disable-infobars --kiosk $KIOSK_URL
--check-for-update-interval=31536000
```
* sudo nano /etc/xdg/openbox/environment
```
export KIOSK_URL=http://localhost:1880/ui
```
* touch ~/.bash_profile
* sudo nano ~/.bash_profile
```
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx -- -nocursor
```
* source ~/.bash_profile
* reboot

Kiosk mode
https://pimylifeup.com/raspberry-pi-kiosk/

