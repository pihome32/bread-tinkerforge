#!/usr/bin/python
'''*****************************************************************************************************************
    Seeed Studio Relay Board Example
    By John M. Wargo
    www.johnwargo.com
********************************************************************************************************************'''
from __future__ import print_function

import sys
import time

from relay_lib_seeed import *



relay = sys.argv[1];
state = sys.argv[2];
print(relay)
if relay =="relay1":
    port = 1;
elif relay =="relay2": port=2;
elif relay =="relay3": port=3;
elif relay =="relay4": port=4;
if (state=="true"):
    relay_on(port);
else :
    relay_off(port);


