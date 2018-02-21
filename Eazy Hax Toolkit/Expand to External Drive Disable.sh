#!/bin/bash
if [ ! -d $HOME/RetroPie/localroms ]; then
    echo ""
    echo ""
    echo "I do not detect that this Retropie is expanded. Killing this script."
    echo ""
    echo ""
	sleep 5
else

sudo sed -i '/addon/d' /etc/fstab
sudo cp /etc/profile.d/10-retropie.sh.org /etc/profile.d/10-retropie.sh
sudo cp /etc/samba/smb.conf.bkup /etc/samba/smb.conf
sudo /usr/sbin/service smbd stop
unlink $HOME/RetroPie/roms; sudo umount $HOME/addonusb; sudo umount overlay; mv $HOME/RetroPie/localroms $HOME/RetroPie/roms; rm -r $HOME/RetroPie/combined_drives; rm -r $HOME/addonusb   > /dev/null 2>&1
sudo reboot
fi
