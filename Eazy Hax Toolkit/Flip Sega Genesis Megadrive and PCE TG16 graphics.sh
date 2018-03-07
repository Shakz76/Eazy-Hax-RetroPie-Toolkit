#!/bin/bash

infobox= ""
infobox="${infobox}___________________________________________________________________________\n\n"
infobox="${infobox}\n"
infobox="${infobox}Swap Sega Genesis/Megadrive and PCE TG16/Graphics\n\n"
infobox="${infobox}This script will swap the Sega Genesis/Sega MegaDrive and or PC Engine and TurboGrafx-16 themes to display on the main menu.\n"
infobox="${infobox}\n"
infobox="${infobox}You will need to restart Emulation Station after making the change.\n"
infobox="${infobox}This can be done by pressing 'Select' > 'Quit' > 'Restart EmulationStation'"

dialog --backtitle "Eazy Hax RetroPie Toolkit" \
--title "Eazy Hax RetroPie Toolkit" \
--msgbox "${infobox}" 15 80

function main_menu() {
    local choice

    while true; do
        choice=$(dialog --backtitle "$BACKTITLE" --title " MAIN MENU " \
            --ok-label OK --cancel-label Exit \
            --menu "What action would you like to perform?" 25 75 20 \
            1 "Change to Sega Genesis" \
            2 "Change to Sega Megadrive" \
            3 "Change to TurboGrafx-16" \
            4 "Change to PC Engine" \
            2>&1 > /dev/tty)

        case "$choice" in
            1) genesis  ;;
            2) megadrive  ;;
            3) tg16  ;;
            4) pce  ;;
            *)  break ;;
        esac
    done
}

function genesis() {
dialog --infobox "...Thinking on that..." 3 26 ; sleep 2
sudo cp /etc/emulationstation/es_systems.cfg /etc/emulationstation/es_systems.cfg.bkp
sudo perl -p -i -e 's/<theme>megadrive<\/theme>/<theme>genesis<\/theme>/g' /etc/emulationstation/es_systems.cfg

}

function megadrive() {
dialog --infobox "...Thinking on that..." 3 26 ; sleep 2
sudo cp /etc/emulationstation/es_systems.cfg /etc/emulationstation/es_systems.cfg.bkp
sudo perl -p -i -e 's/<theme>genesis<\/theme>/<theme>megadrive<\/theme>/g' /etc/emulationstation/es_systems.cfg

}

function tg16() {
dialog --infobox "...Thinking on that..." 3 26 ; sleep 2
sudo cp /etc/emulationstation/es_systems.cfg /etc/emulationstation/es_systems.cfg.bkp
sudo perl -p -i -e 's/<theme>pcengine<\/theme>/<theme>tg16<\/theme>/g' /etc/emulationstation/es_systems.cfg

}

function pce() {
dialog --infobox "...Thinking on that..." 3 26 ; sleep 2
sudo cp /etc/emulationstation/es_systems.cfg /etc/emulationstation/es_systems.cfg.bkp
sudo perl -p -i -e 's/<theme>tg16<\/theme>/<theme>pcengine<\/theme>/g' /etc/emulationstation/es_systems.cfg

}

main_menu
