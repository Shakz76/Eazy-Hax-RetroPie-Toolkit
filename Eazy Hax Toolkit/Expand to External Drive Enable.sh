#!/bin/bash
# Script created by Forrest to expand the roms file system to an external
# So folks will stop getting ripped off for bigger drives on ebay.
testdrive=`df |grep media |awk '{print $1 }'|wc -l`
if [ $testdrive -eq 0 ] ; then
echo "No External drive detected. Exiting."
sleep 5
exit
else
echo "External Drive detected. Performing checks for NTFS filesystem."
sleep 5
fi

EXTDR=`sudo blkid |grep -v mmc|grep ntfs`
usb_mount=`echo $EXTDR|awk '{print $1 }'|tr -d :`
usb_filesystem=`echo $EXTDR |grep -Po 'TYPE="\K.*?(?=")'`
usb_uuid=`echo $EXTDR|grep $usb_mount|awk '{print $2 }' |grep -Po 'UUID="\K.*?(?=")'`

if [ "$usb_filesystem" != "ntfs" ] ; then
echo "This external drive is not correctly formatted. It must be formatted using the NTFS filesystem. Please reformat it to NTFS."
echo "Fat vfat exfat filesystems are not supported"
sleep 10; exit
else echo "External drive checks out. Correctly formatted to NTFS"
sleep 5
fi

sudo grep -w UUID /etc/fstab |grep -v ext4 > /dev/null 2>&1
if [ $? -eq 0 ] ; then
echo "It seems you already have an external drive mapped. Only one external drive is supported. Please run the "Remove Drive Expansion" script from the Retropie menu before adding a new drive."
sleep 10
exit
else
mkdir $HOME/addonusb > /dev/null 2>&1
echo "UUID=$usb_uuid  $HOME/addonusb      $usb_filesystem    nofail,user,umask=0000  0       2" > $HOME/.currentdrive
sudo sh -c "cat $HOME/.currentdrive >> /etc/fstab"
sudo umount $usb_mount
sudo mount -a
fi
testdrive2=`df |grep addonusb|wc -l`
if [ $testdrive2 -eq 0 ] ; then
	echo -e "Something went wrong. Unable to detect that external drive mounted correctly. Exiting...."
	sleep 5
	exit
fi


mkdir $HOME/addonusb/roms/
echo "Syncing the roms on your internal drive to the external drive. They will be located in the "roms" directory on your external drive"
sleep 3
sudo chmod 777  $HOME/addonusb
cp -vr  $HOME/RetroPie/roms/ $HOME/addonusb/
echo -e "\n\n\nFinshed moving your files to the external drive. Linking your odroid to the external drive\n\n\n"
mv $HOME/RetroPie/roms $HOME/RetroPie/localroms
cd $HOME/RetroPie
ln -s $HOME/addonusb/roms roms
echo "Roms directory linked to your external drive. Rebooting"
sleep 5
sudo reboot
