#!/usr/bin/env bash

infobox= ""
infobox="${infobox}___________________________________________________________________________\n\n"
infobox="${infobox}Install Backgroud Music\n\n"
infobox="${infobox}This script will install and setup backgroud music for you.\n"
infobox="${infobox}    NOTE: Your system will reboot after removal or Install of Background Music\n"
infobox="${infobox}You can change out the default background music by accessing the 'music' directory in your roms directory.\n"
infobox="${infobox}Once installed you can adjust the volume to your liking with this script as well.\n"
infobox="${infobox}I will also add a 'Background Music Toggle' script to your default 'Retropie' menu so you can shut it off or start it any time.\n\n"
infobox="${infobox}This script was written with MUCH retro love for my fellow Retro-Gamers\n"
infobox="${infobox}I really hope it helps you make your retro rig exactly how you want it.\n"
infobox="${infobox}-Forrest aka Eazy Hax on Youtube\n"
infobox="${infobox}___________________________________________________________________________\n\n"

dialog --backtitle "Eazy Hax RetroPie Toolkit" \
--title "Eazy Hax RetroPie Toolkit" \
--msgbox "${infobox}" 23 80

function main_menu() {
    local choice

    while true; do
        choice=$(dialog --backtitle "$BACKTITLE" --title " MAIN MENU " \
            --ok-label OK --cancel-label Exit \
            --menu "What action would you like to perform?" 25 75 20 \
            1 "Install Background Music" \
            2 "Set Background Musc Volume - Only after you install it" \
            3 "Remove Background Music" \
            2>&1 > /dev/tty)

        case "$choice" in
            1) install_bgm  ;;
            2) vol_menu  ;;
            3) remove_bgm  ;;
            *)  break ;;
        esac
    done
}

function vol_menu() {
    local choice

    while true; do
        choice=$(dialog --backtitle "$BACKTITLE" --title " MAIN MENU " \
            --ok-label OK --cancel-label Exit \
            --menu "You can choose the volume level one after another until you are happy with your settings." 25 75 20 \
            1 "Set Background Music volume to 100%" \
            2 "Set Background Music volume to 90%" \
            3 "Set Background Music volume to 80%" \
            4 "Set Background Music volume to 70%" \
            5 "Set Background Music volume to 60%" \
            6 "Set Background Music volume to 50%" \
            7 "Set Background Music volume to 40%" \
            8 "Set Background Music volume to 30%" \
            9 "Set Background Music volume to 20%" \
            10 "Set Background Music volume to 10%" \
            2>&1 > /dev/tty)

        case "$choice" in
            1) 100_v  ;;
            2) 90_v  ;;
            3) 80_v  ;;
            4) 70_v  ;;
            5) 60_v  ;;
            6) 50_v  ;;
            7) 40_v  ;;
            8) 30_v  ;;
            9) 20_v  ;;
            10) 10_v  ;;
            *)  break ;;
        esac
    done
}

function install_bgm() {
        sudo grep livewire /etc/rc.local > /dev/null 2>&1
        if [ $? -eq 0 ] ; then
        echo -e "\n\n\n         It looks like Background Music is already installed. Exiting......\n\n\n"
        sleep 5
        exit
        fi
        PKG=python-pygame
        PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $PKG|grep "install ok installed")
        if [ "" == "$PKG_OK" ]; then
                echo -e "\n\n\n     No $PKG installed. Setting up $PKG.\n\n\n"
                sleep 3
                sudo apt-get update; sudo apt-get install -y $PKG
        else
        echo -e "\n\n\n    $PKG seems to be installed...moving on with the Livewire background music install"
        sleep 3
        fi
        wget https://raw.githubusercontent.com/Shakz76/Eazy-Hax-RetroPie-Toolkit/master/cfg/Toggle%20Background%20Music.sh -O /home/pi/RetroPie/retropiemenu/Toggle\ Background\ Music.sh
        cd $HOME && wget https://raw.githubusercontent.com/Shakz76/Eazy-Hax-RetroPie-Toolkit/master/cfg/.livewire.py -O /home/pi/.livewire.py
        sudo perl -i.bak -pe '$_ = qq[(sudo python /home/pi/.livewire.py) &\n$_] if $_ eq qq[exit 0\n]'  /etc/rc.local
        if [ ! -d "$HOME/RetroPie/roms/music" ]; then
                echo -e "\n\n\n    Music directory is missing. Downloading some starter music for you.\n\n\n"
                sleep 3
                cd /home/pi/RetroPie/roms/
                wget http://eazyhax.com/downloads/music.zip -O /home/pi/RetroPie/roms/music.zip
                unzip -o music.zip  && rm music.zip
        fi
        vol_menu
}

function remove_bgm() {
	pgrep -f "python /home/pi/.livewire.py"|xargs sudo kill -9
	rm -f /home/pi/RetroPie/retropiemenu/Toggle\ Background\ Music.sh
	rm /home/pi/.livewire.py
	if [ -e /home/pi/.DisableMusic ]; then
		rm /home/pi/.DisableMusic
	fi
	rm -r  /home/pi/RetroPie/roms/music/
	sudo sed -i '/livewire/d' /etc/rc.local
	echo -e "\n\n\n         Background Music has been removed from your system.\n\n\n"
	sleep 5
}



function 100_v() {
        CUR_VAL=`grep "maxvolume =" /home/pi/.livewire.py|awk '{print $3}'`
        export CUR_VAL
        perl -p -i -e 's/maxvolume = $ENV{CUR_VAL}/maxvolume = 1.0/g' /home/pi/.livewire.py
        pgrep -f "python /home/pi/.livewire.py"|xargs sudo kill -9
        sudo python /home/pi/.livewire.py  --silent &
}
function 90_v() {
        CUR_VAL=`grep "maxvolume =" /home/pi/.livewire.py|awk '{print $3}'`
        export CUR_VAL
        perl -p -i -e 's/maxvolume = $ENV{CUR_VAL}/maxvolume = 0.90/g' /home/pi/.livewire.py
        pgrep -f "python /home/pi/.livewire.py"|xargs sudo kill -9
        sudo python /home/pi/.livewire.py  --silent &
}
function 80_v() {
        CUR_VAL=`grep "maxvolume =" /home/pi/.livewire.py|awk '{print $3}'`
        export CUR_VAL
        perl -p -i -e 's/maxvolume = $ENV{CUR_VAL}/maxvolume = 0.80/g' /home/pi/.livewire.py
        pgrep -f "python /home/pi/.livewire.py"|xargs sudo kill -9
        sudo python /home/pi/.livewire.py  --silent &
}
function 70_v() {
        CUR_VAL=`grep "maxvolume =" /home/pi/.livewire.py|awk '{print $3}'`
        export CUR_VAL
        perl -p -i -e 's/maxvolume = $ENV{CUR_VAL}/maxvolume = 70.0/g' /home/pi/.livewire.py
        pgrep -f "python /home/pi/.livewire.py"|xargs sudo kill -9
        sudo python /home/pi/.livewire.py  --silent &
}
function 60_v() {
        CUR_VAL=`grep "maxvolume =" /home/pi/.livewire.py|awk '{print $3}'`
        export CUR_VAL
        perl -p -i -e 's/maxvolume = $ENV{CUR_VAL}/maxvolume = 60.0/g' /home/pi/.livewire.py
        pgrep -f "python /home/pi/.livewire.py"|xargs sudo kill -9
        sudo python /home/pi/.livewire.py  --silent &
}
function 50_v() {
        CUR_VAL=`grep "maxvolume =" /home/pi/.livewire.py|awk '{print $3}'`
        export CUR_VAL
        perl -p -i -e 's/maxvolume = $ENV{CUR_VAL}/maxvolume = 0.50/g' /home/pi/.livewire.py
        pgrep -f "python /home/pi/.livewire.py"|xargs sudo kill -9
        sudo python /home/pi/.livewire.py  --silent &
}
function 40_v() {
        CUR_VAL=`grep "maxvolume =" /home/pi/.livewire.py|awk '{print $3}'`
        export CUR_VAL
        perl -p -i -e 's/maxvolume = $ENV{CUR_VAL}/maxvolume = 0.40/g' /home/pi/.livewire.py
        pgrep -f "python /home/pi/.livewire.py"|xargs sudo kill -9
        sudo python /home/pi/.livewire.py  --silent &
}
function 30_v() {
        CUR_VAL=`grep "maxvolume =" /home/pi/.livewire.py|awk '{print $3}'`
        export CUR_VAL
        perl -p -i -e 's/maxvolume = $ENV{CUR_VAL}/maxvolume = 0.30/g' /home/pi/.livewire.py
        pgrep -f "python /home/pi/.livewire.py"|xargs sudo kill -9
        sudo python /home/pi/.livewire.py  --silent &
}
function 20_v() {
        CUR_VAL=`grep "maxvolume =" /home/pi/.livewire.py|awk '{print $3}'`
        export CUR_VAL
        perl -p -i -e 's/maxvolume = $ENV{CUR_VAL}/maxvolume = 0.20/g' /home/pi/.livewire.py
        pgrep -f "python /home/pi/.livewire.py"|xargs sudo kill -9
        sudo python /home/pi/.livewire.py  --silent &
}
function 10_v() {
        CUR_VAL=`grep "maxvolume =" /home/pi/.livewire.py|awk '{print $3}'`
        export CUR_VAL
        perl -p -i -e 's/maxvolume = $ENV{CUR_VAL}/maxvolume = 0.10/g' /home/pi/.livewire.py
        pgrep -f "python /home/pi/.livewire.py"|xargs sudo kill -9
        sudo python /home/pi/.livewire.py  --silent &
}


main_menu

