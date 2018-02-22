#!/bin/bash


sudo perl -p -i -e 's/RANDOMIZE="disabled"/RANDOMIZE="custom"/g' /etc/init.d/asplashscreen

cd /home/pi/RetroPie/splashscreens/
wget http://eazyhax.com/pitime/EazyHax_Favorite_splashscreens.zip
unzip EazyHax_Favorite_splashscreens.zip
rm EazyHax_Favorite_splashscreens.zip
sudo reboot

