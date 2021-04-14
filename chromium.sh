#!/bin/bash
if pidof chromium-browser > /dev/null
then
  echo running
else
DISPLAY=:0 chromium-browser --disable-infobars --noerrdialogs --app=http://localhost:1880/ui -start-fullscreen;
fi
