#!/bin/bash
sudo grep hdmi_mode=4 /boot/config.txt > /dev/null 2>&1
if [ $? -eq 0 ] ; then
echo "It looks like you have tried the Force 720p script. Please run it again to roll the changes back before running this script."
sleep 10
exit
fi
sudo grep hdmi_mode=16 /boot/config.txt > /dev/null 2>&1
if [ $? -eq 0 ] ; then
echo "Looks like we have already tried to force 1080p output. If you are still not getting audio then there must be another issue."
sleep 4
echo "For now I will reverse the changes since they did not help you. They will take effect after the next reboot"
sleep 5
sudo perl -p -i -e 's/hdmi_group=1/#hdmi_group=1/g' /boot/config.txt
sudo perl -p -i -e 's/hdmi_mode=16/#hdmi_mode=1/g' /boot/config.txt
else
echo "I have scanned the config file and see that 1080p is not being forced."
sleep 4
echo "I will make the necessary config changes and reboot your Pi"
sleep 5
sudo perl -p -i -e 's/#hdmi_group=1/hdmi_group=1/g' /boot/config.txt
sudo perl -p -i -e 's/#hdmi_mode=1/hdmi_mode=16/g' /boot/config.txt
sudo reboot
fi
