#!/bin/bash
sudo grep "<theme>megadrive</theme>" /etc/emulationstation/es_systems.cfg > /dev/null 2>&1
if [ $? -eq 0 ] ; then

echo "Flipping displays for MegaDrive and PC Engine/ Genesis and TG16."
sleep 5
sudo perl -p -i -e 's/<theme>megadrive<\/theme>/<theme>genesis<\/theme>/g' /etc/emulationstation/es_systems.cfg
sudo perl -p -i -e 's/<theme>pcengine<\/theme>/<theme>tg16<\/theme>/g' /etc/emulationstation/es_systems.cfg
sudo reboot
else
sudo perl -p -i -e 's/<theme>genesis<\/theme>/<theme>megadrive<\/theme>/g' /etc/emulationstation/es_systems.cfg
sudo perl -p -i -e 's/<theme>tg16<\/theme>/<theme>pcengine<\/theme>/g' /etc/emulationstation/es_systems.cfg
sudo reboot
fi
