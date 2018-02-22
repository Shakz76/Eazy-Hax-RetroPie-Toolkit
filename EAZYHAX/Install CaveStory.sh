#!/bin/bash

echo "You must be connected to the internet for this to work."
sleep 2
runuser -l pi -c 'cd /home/pi/RetroPie/roms/ports; wget http://eazyhax.com/downloads/cavestoryen.zip; unzip cavestoryen.zip; rm cavestoryen.zip'
if [ -d "/home/pi/RetroPie/roms/ports/CaveStory" ]; then
echo "Looks like its installed and you are good to go. Have fun!"
else
echo "Looks like something went wrong. I do not see that CaveStory is installed."
fi
sleep 5
exit

