#!/bin/bash
if [ ! -f /usr/bin/svn ]; then
	echo "Subversion (the tool used to manage updates) is missing. Installing it now"
	sleep 5
	sudo apt-get install -y subversion
fi

cd ~/RetroPie/retropiemenu/Eazy\ Hax\ Toolkit/
svn checkout https://github.com/Shakz76/Eazy-Hax-RetroPie-Toolkit/trunk/Eazy%20Hax%20Toolkit

REV=`svn info | grep "Revision" | awk '{print $2}'`
DATE=`svn info | grep "Last Changed Date" |awk '{print $4}'`
TIME=`svn info | grep "Last Changed Date" |awk '{print $5}'`
echo "You have been upgraded to the latest version $REV"
echo "Last update was on $DATE at $TIME"
echo "Rebooting your system shortly so that the changes take effect, and or new scripts show up."
sleed 10
sudo reboot