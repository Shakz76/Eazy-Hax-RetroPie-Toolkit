#!/usr/bin/env bash
echo "Your Retropie is about to reboot so that the settings take effect!"
sleep 5

sudo perl -p -i -e 's/disable_overscan=1/#disable_overscan=1/g' /boot/config.txt

sudo reboot
