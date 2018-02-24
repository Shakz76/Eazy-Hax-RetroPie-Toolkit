#!/bin/bash

DISKSPACE=`df -kh /home/pi/RetroPie/roms | tail -1 | tr -s ' ' | cut -d' ' -f4`
echo ""
echo ""
echo "You have $DISKSPACE available on your RetroPie SD Card."
if [ -d "/home/pi/addonusb/roms" ]; then
EXP_DISKSPACE=`df -kh /home/pi/addonusb| tail -1 | tr -s ' ' | cut -d' ' -f4`
echo ""
echo ""
echo "You have $EXP_DISKSPACE available on your RetroPie Expanded External Drive."
sleep 10
fi
sleep 10
exit

