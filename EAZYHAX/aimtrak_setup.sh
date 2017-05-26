#!/usr/bin/env bash
echo "Checking to see if advance-mame 1.4 is installed if it is not I will install it. This will take a little while to run......."
sleep 5

if [ ! -d "/home/pi/RetroPie/roms/mame-advmame" ]; then
        echo "Advance-Mame not found. Installing version 1.4. This will take around 30min."
        sleep 10
        sudo /home/pi/RetroPie-Setup/retropie_packages.sh 101
fi

echo ""
echo ""
echo "Instlling the needed packages for the gun configureation application."
sleep 3
sudo apt-get -y install apt-transport-https python-dev python-pygame python-setuptools
echo ""
echo ""
echo "Making advance mame config changes so your Aimtrak will be detected in game."
sleep 3
sed -i 's/device_mouse auto/device_mouse raw/g' /home/pi/.advance/advmame-1.4.rc
sed -i 's/device_raw_mousedev\[0\] auto/device_raw_mousedev[0] \/dev\/input\/mouse0/g' /home/pi/.advance/advmame-1.4.rc
sed -i 's/device_raw_mousedev\[1\] auto/device_raw_mousedev[1] \/dev\/input\/mouse1/g' /home/pi/.advance/advmame-1.4.rc
sed -i 's/device_raw_mousedev\[2\] auto/device_raw_mousedev[2] \/dev\/input\/mouse2/g' /home/pi/.advance/advmame-1.4.rc
sed -i 's/device_raw_mousedev\[3\] auto/device_raw_mousedev[3] \/dev\/input\/mouse3/g' /home/pi/.advance/advmame-1.4.rc
sed -i 's/device_raw_mousetype\[0\] pnp/device_raw_mousetype[0] ps2/g' /home/pi/.advance/advmame-1.4.rc
sed -i 's/device_raw_mousetype\[1\] pnp/device_raw_mousetype[1] ps2/g' /home/pi/.advance/advmame-1.4.rc
sed -i 's/device_raw_mousetype\[2\] pnp/device_raw_mousetype[2] ps2/g' /home/pi/.advance/advmame-1.4.rc
sed -i 's/device_raw_mousetype\[3\] pnp/device_raw_mousetype[3] ps2/g' /home/pi/.advance/advmame-1.4.rc
echo ""
echo ""
echo "Downloading and installing cheats. I will then enable cheats for Advance-Mame if they are needed."
sleep 5
if [ ! -f "/home/pi/.advance/cheat.dat" ]; then
	echo ""
    echo ""
	echo "Cheats are not installed. Installing them and enabling them for you."
	sleep 5
cd /home/pi/.advance
wget https://raw.githubusercontent.com/libretro/mame2003-libretro/master/metadata/cheat.dat
sed -i 's/misc_cheat no/misc_cheat yes/g' /home/pi/.advance/advmame-1.4.rc
fi
echo ""
echo ""
echo "Downloading gun configureation application. This will appear in your RetroPie menu after install. You will need to calibrate the gun prior to gameplay."
sleep 8
git clone https://github.com/gunpadawan/gunconf.git
cd gunconf
sudo cp utils/aimtrak.rules /etc/udev/rules.d/99-aimtrak.rules
sudo udevadm control --reload-rules
sudo python setup.py install
cp ./utils/gunconf.sh ~/RetroPie/retropiemenu/
echo ""
echo ""
echo "Checking to see if you have any shooters. If not snagging a few to get you started"
cd /home/pi/RetroPie/roms/mame-advmame/
if [ ! -f "/home/pi/RetroPie/roms/mame-advmame/alien3.zip" ]; then
        wget http://eazyhax.com/pitime/shooter/alien3.zip
fi
if [[ ! -f "/home/pi/RetroPie/roms/mame-advmame/le2.zip" ]]; then
        wget http://eazyhax.com/pitime/shooter/le2.zip
fi
if [[ ! -f "/home/pi/RetroPie/roms/mame-advmame/duckhunt.zip" ]]; then
        wget http://eazyhax.com/pitime/shooter/duckhunt.zip
fi
echo ""
echo ""
echo "All done. Enjoy and remember....One shot one kill! Your Pi will now reboot"
sleep 10
sudo reboot
