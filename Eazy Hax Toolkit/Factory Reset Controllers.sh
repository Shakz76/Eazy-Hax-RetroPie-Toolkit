#!/bin/bash
echo "This will reset all of your controllers, then reboot your pi"
sleep 5
echo "This will wipe out all controller configurations, and reset everything to factory default."
sleep 4
echo "You will need to reconfigure all of your controllers."
sleep 2
rm /opt/retropie/configs/all/retroarch-joypads/*
cd /home/pi/.emulationstation/
rm es_input.cfg
runuser -l pi -c 'cd /home/pi/.emulationstation/; cp /home/pi/RetroPie/retropiemenu/EAZYHAX/es_input.cfg.bkup es_input.cfg'

sudo reboot
exit

