#!/bin/bash
sudo grep quirks /boot/cmdline.txt > /dev/null 2>&1
if [ $? -eq 0 ] ; then
echo "It looks like you have Xin Mo enabled on this pi. Rolling back the changes now."
echo "If you wanted to keep it enabled then just run this script again and that will re-enable it. "
sudo cp /home/pi/RetroPie/retropiemenu/EAZYHAX/cmdline.txt.org /boot/cmdline.txt
sleep 10
exit
else
echo "Making the needed changes so your Xin Mo controller will show up as two controllers."
sleep 5
sudo cp /home/pi/RetroPie/retropiemenu/EAZYHAX/cmdline.txt.xin /boot/cmdline.txt
echo "The changes have been made. We will now reboot for the changes to take effect."
sleep 6
sudo reboot
fi
