plink -ssh -l pi -pw raspberry retropie sudo perl -p -i -e 's/disable_overscan=1/#disable_overscan=1/g' /boot/config.txt; sudo reboot
EXIT