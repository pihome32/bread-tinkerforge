#!/usr/bin/python
'''*****************************************************************************************************************
    Seeed Studio Relay Board Example
    By John M. Wargo
    www.johnwargo.com
********************************************************************************************************************'''
from __future__ import print_function

import sys
import time

state1 = sys.argv[1];
state2 = sys.argv[2];



#!/usr/bin/env python
# -*- coding: utf-8 -*-

HOST = "localhost"
PORT = 4223
UID = "FLM" # Change XYZ to the UID of your Industrial Dual Relay Bricklet

print(state1)

import time

from tinkerforge.ip_connection import IPConnection
from tinkerforge.bricklet_industrial_dual_relay import BrickletIndustrialDualRelay
if state1 == "true" :
    state1 = True
else :
    state1 = False
if state2 == "true" :
    state2 = True
else :
    state2 = False
    
    
if __name__ == "__main__":
    ipcon = IPConnection() # Create IP connection
    idr = BrickletIndustrialDualRelay(UID, ipcon) # Create device object

    ipcon.connect(HOST, PORT) # Connect to brickd
    idr.set_value(state1, state2)
   
    ipcon.disconnect()



