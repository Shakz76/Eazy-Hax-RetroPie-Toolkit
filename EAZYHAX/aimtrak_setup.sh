#!/usr/bin/env bash
echo "Checking to see if advance-mame 1.4 is installed if it is not I will install it. This will take a little while to run......."
sleep 10

if [ ! -d "/home/pi/RetroPie/roms/mame-advmame" ]; then
        echo "Advance-Mame not found. Installing version 1.4. This will take around 30min."
        sleep 10
        sudo /home/pi/RetroPie-Setup/retropie_packages.sh 101
fi


echo "Instlling the needed packages for the gun configureation application."
sleep 3
sudo apt-get -y install apt-transport-https python-dev python-pygame python-setuptools



sed -i 's/device_mouse auto/device_mouse auto/g' /home/pi/.advance/advmame-1.4.rc
sed -i 's/device_raw_mousedev\[0\] auto/device_raw_mousedev[0] \/dev\/input\/mouse0/g' /home/pi/.advance/advmame-1.4.rc
sed -i 's/device_raw_mousedev\[1\] auto/device_raw_mousedev[1] \/dev\/input\/mouse1/g' /home/pi/.advance/advmame-1.4.rc
sed -i 's/device_raw_mousedev\[2\] auto/device_raw_mousedev[2] \/dev\/input\/mouse2/g' /home/pi/.advance/advmame-1.4.rc
sed -i 's/device_raw_mousedev\[3\] auto/device_raw_mousedev[3] \/dev\/input\/mouse3/g' /home/pi/.advance/advmame-1.4.rc
sed -i 's/device_raw_mousetype\[0\] pnp/ddevice_raw_mousetype[0] ps2/g' /home/pi/.advance/advmame-1.4.rc
sed -i 's/device_raw_mousetype\[1\] pnp/ddevice_raw_mousetype[1] ps2/g' /home/pi/.advance/advmame-1.4.rc
sed -i 's/device_raw_mousetype\[2\] pnp/ddevice_raw_mousetype[2] ps2/g' /home/pi/.advance/advmame-1.4.rc
sed -i 's/device_raw_mousetype\[3\] pnp/ddevice_raw_mousetype[3] ps2/g' /home/pi/.advance/advmame-1.4.rc

git clone https://github.com/gunpadawan/gunconf.git
cd gunconf
sudo cp utils/aimtrak.rules /etc/udev/rules.d/99-aimtrak.rules
sudo udevadm control --reload-rules
sudo python setup.py install
cp ./utils/gunconf.sh ~/RetroPie/retropiemenu/

cd /home/pi/RetroPie/roms/mame-advmame/
wget http://eazyhax.com/pitime/duckhunt.zip
