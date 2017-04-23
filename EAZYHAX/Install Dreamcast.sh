#!/bin/bash

echo "You must be connected to the internet for this to work."
sleep 2
#!/bin/bash
system=Dreamcast

if [ -d "/home/pi/addonusb/piroms/roms" ]; then
space=`df /home/pi/addonusb/piroms/roms | awk 'NR==2 {print $4}'`
if [ $space -lt 5000000 ]; then
        echo ""
        echo ""
        echo "You must have at least 5G of space to perform this install."
        echo "Right now you have `df -h /home/pi/addonusb/piroms/roms | awk 'NR==2 {print $4}'`. You will need to delete some games from Playstation or another disk system to make room for the $system install."
        echo "You can use the Disk Space script under the Retropie/Forrest menu to check your disk space after deleting some unwanted games.";
        echo ""
        echo ""
        sleep 15
        exit
else
runuser -l pi -c 'cd /home/pi/addonusb/piroms/roms/dreamcast; wget http://eazyhax.com/downloads/dreamcast.tar && tar -xvf dreamcast.tar && sleep 3 ;rm dreamcast.tar; sleep 1; mv dc_* /home/pi/RetroPie/BIOS/; ln -sv fileThatDoesNotExist ~/RetroPie/roms/dreamcast/systemManager.cdi'
runuser -l pi -c 'cd /home/pi/addonusb/piroms/roms/dreamcast; mv vmu_save* /opt/retropie/configs/dreamcast'
echo "Dreamcast has been installed and configured. You get a free starter game. The rest is up to you. Have Fun! You will need to restart emulationstation for it to show up."
sleep 10
exit
fi

else
space=`df / | awk 'NR==2 {print $4}'`
if [ $space -lt 5000000 ]; then
        echo ""
        echo ""
        echo "You must have at least 5G of space to perform this install."
        echo "Right now you have `df -h / | awk 'NR==2 {print $4}'`. You will need to delete some games from Playstation to make room for the $system install."
        echo "You can use the Disk Space script under the Retropie/Forrest menu to check your disk space after deleting some unwanted games.";
        echo ""
        echo ""
        sleep 15
        exit
else
runuser -l pi -c 'cd /home/pi/RetroPie/roms/dreamcast; wget http://192.168.1.4/downloads/dreamcast.tar && tar -xvf dreamcast.tar && sleep 3 ;rm dreamcast.tar; sleep 1; mv dc_* /home/pi/RetroPie/BIOS/; ln -sv fileThatDoesNotExist ~/RetroPie/roms/dreamcast/systemManager.cdi'
runuser -l pi -c 'cd /home/pi/RetroPie/roms/dreamcast; mv vmu_save* /opt/retropie/configs/dreamcast'
echo "Dreamcast has been installed and configured. You get a free starter game. The rest is up to you. Have Fun!"
sleep 10
exit
fi
fi

