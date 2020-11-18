#!/usr/bin/env python
# -*- coding: utf-8 -*-

HOST = "localhost"
PORT = 4223
UID = "vm5" # Change XYZ to the UID of your Analog Out Bricklet 2.0

from tinkerforge.ip_connection import IPConnection
from tinkerforge.bricklet_analog_out_v2 import BrickletAnalogOutV2

if __name__ == "__main__":
    ipcon = IPConnection() # Create IP connection
    ao = BrickletAnalogOutV2(UID, ipcon) # Create device object

    ipcon.connect(HOST, PORT) # Connect to brickd
    # Don't use device before ipcon is connected

    # Set output voltage to 3.3V
    print(ao.get_output_voltage())

    input("Press key to exit\n") # Use raw_input() in Python 2
    ipcon.disconnect()