#!/bin/bash

sudo grep powerpi.py /etc/rc.local > /dev/null 2>&1

if [ $? -eq 0 ] ; then
	echo "Power button has already been enabled. No need to run this again. If you are seeing an issue post in the video...lets get it fixed!"
	sleep 10
	exit
else
	sudo sed -i '/fi/a \ sudo python /home/pi/.powerpi.py --silent & \' /etc/rc.local
	cd /home/pi/ && wget https://raw.githubusercontent.com/Shakz76/Eazy-Hax-RetroPie-Toolkit/master/cfg/.powerpi.py
	sudo reboot
fi
