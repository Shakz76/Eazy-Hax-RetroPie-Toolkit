#!/bin/bash
if [ ! -f /usr/bin/svn ]; then
	echo "Subversion (the tool used to manage updates) is missing. Installing it now"
	sleep 5
	sudo apt-get install -y subversion
fi

cd /home/pi/RetroPie/retropiemenu
svn checkout https://github.com/Shakz76/Eazy-Hax-RetroPie-Toolkit/trunk/Eazy%20Hax%20Toolkit
cd /home/pi/RetroPie/retropiemenu/Eazy\ Hax\ Toolkit/
REV=`svn info | grep "Revision" | awk '{print $2}'`
DATE=`svn info | grep "Last Changed Date" |awk '{print $4}'`
TIME=`svn info | grep "Last Changed Date" |awk '{print $5}'`
echo "You have installed the latest version $REV of the Eazy Hax RetroPie Toolkit"
echo "Last update was on $DATE at $TIME"
echo "You can now run the toolkit directly from your RetroPie Menu under the Eazy Hax Toolkit directory."
echo "Rebooting your system shortly so that the changes take effect, and or new scripts show up."
sleep 10
sudo reboot