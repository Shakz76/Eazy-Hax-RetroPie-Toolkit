#!/bin/bash
echo "Fetching new troubleshooting scripts."
sleep 6
runuser -l pi -c 'cd /home/pi/RetroPie/retropiemenu/; wget -N http://eazyhax.com/pitime/scripts/retropie.tar'
runuser -l pi -c 'cd /home/pi/RetroPie/retropiemenu/; tar -xvf ./retropie.tar; rm ./retropie.tar' /dev/null 2>&1
echo ""
echo ""
echo "Your pie will now reboot so the new scripts are picked up in the menu."
sleep 6
sudo reboot
