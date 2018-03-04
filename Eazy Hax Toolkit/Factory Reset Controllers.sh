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
cd /home/pi/.emulationstation/; curl -o es_input.cfg https://raw.githubusercontent.com/Shakz76/Eazy-Hax-RetroPie-Toolkit/master/cfg/es_input.cfg.bkup

sudo reboot
exit
