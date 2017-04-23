#!/bin/bash
sudo grep hdmi_mode=16 /boot/config.txt > /dev/null 2>&1
if [ $? -eq 0 ] ; then
echo "It looks like you have tried the Force 1080p script. Please run it again to roll the changes back before running this script."
sleep 10
exit
fi
sudo grep hdmi_mode=4 /boot/config.txt > /dev/null 2>&1
if [ $? -eq 0 ] ; then
echo "The Audio changes have already been made. If you are still not getting audio then there must be another issue."
sleep 4
echo "For now I will reverse the changes since they did not help you."
sleep 5
sudo perl -p -i -e 's/hdmi_group=1/#hdmi_group=1/g' /boot/config.txt
sudo perl -p -i -e 's/hdmi_mode=4/#hdmi_mode=1/g' /boot/config.txt
else
echo "I have scanned the config file and see that Force 720p is not cofigured."
sleep 4
echo "I will make the necessary config changes and reboot your Pi. If this does not fix your issue please run this script again to reverse the changes."
sleep 5
sudo perl -p -i -e 's/#hdmi_group=1/hdmi_group=1/g' /boot/config.txt
sudo perl -p -i -e 's/#hdmi_mode=1/hdmi_mode=4/g' /boot/config.txt
sudo reboot
fi
