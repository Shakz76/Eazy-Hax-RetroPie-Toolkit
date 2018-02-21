#!/usr/bin/env bash
echo "Making N64 tweaks for you."
sleep 5
perl -p -i -e 's/txHiresEnable = False/txHiresEnable = True/g' /opt/retropie/configs/n64/mupen64plus.cfg
echo "Checking if needed directory is there."
if [ -d "/home/pi/.local/share/mupen64plus/hires_texture" ]; then
echo "Config changes made, and the needed paths are in place. Fetching Hi Res Texture Pack for Mario 64"
cd /home/pi/.local/share/mupen64plus/hires_texture && wget http://eazyhax.com/pitime/SUPER%20MARIO%2064.zip
unzip SUPER\ MARIO\ 64.zip
rm SUPER\ MARIO\ 64.zip
echo ""
echo ""
echo "All done...no need to reboot or anything. Just start playing :-)"
echo ""
echo ""
else
echo "Texture pack directoy is missing. Creating it for you."
mkdir /home/pi/.local/share/mupen64plus/hires_texture
cd /home/pi/.local/share/mupen64plus/hires_texture && wget http://eazyhax.com/pitime/SUPER%20MARIO%2064.zip
unzip SUPER\ MARIO\ 64.zip
rm SUPER\ MARIO\ 64.zip
sleep 10
fi
exit

