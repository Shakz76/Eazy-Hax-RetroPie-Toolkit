#!/bin/bash
if [ ! -d /home/pi/RetroPie/localroms ]; then
    echo ""
    echo ""
    echo "I do not detect that this Retropie is expanded. Killing this script."
    echo ""
    echo ""
	sleep 5
else

sudo sed -i '/UUID/d' /etc/fstab
sudo cp /home/pi/RetroPie/retropiemenu/EAZYHAX/10-retropie.org /etc/profile.d/10-retropie.sh
sudo sed -i 's@/home/pi/addonusb/piroms/roms@/home/pi/RetroPie/roms@g' /etc/samba/smb.conf
runuser -l pi -c 'unlink /home/pi/RetroPie/roms; sudo umount /home/pi/addonusb; sudo umount overlay; sudo umount /home/pi/RetroPie/roms;rm -r /home/pi/RetroPie/roms; mv /home/pi/RetroPie/localroms /home/pi/RetroPie/roms' > /dev/null 2>&1
sudo reboot
fi
