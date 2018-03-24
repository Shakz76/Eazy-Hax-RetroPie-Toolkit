#!/usr/bin/env bash
stop_bgm(){
        touch /home/pi/.DisableMusic
    clear
        echo -e "\n\n\n                               Background Music Stopped\n\n\n"
        sleep 3
}

start_bgm(){
        rm /home/pi/.DisableMusic
        echo -e "\n\n\n                                    Background Music Started\n\n\n"
        sleep 3
}

if [ -e /home/pi/.DisableMusic ]; then
        start_bgm
else
        stop_bgm
fi
exit
