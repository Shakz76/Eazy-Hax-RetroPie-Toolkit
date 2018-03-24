#!/usr/bin/env bash
stop_bgm(){
         pgrep -f "python /home/pi/.livewire.py"|tail -1|xargs sudo kill -STOP
    clear
        echo -e "\n\n\n                               Background Music Stopped\n\n\n"
        sleep 3
}

start_bgm(){
        pgrep -f "python /home/pi/.livewire.py"|tail -1|xargs sudo kill -CONT
        echo -e "\n\n\n                                    Background Music Started\n\n\n"
        sleep 3
}

STATE=`pgrep -f "python /home/pi/.livewire.py"|tail -1|xargs ps -o state= -p`
if [ $STATE = "S" ]; then
    stop_bgm
elif [ $STATE = "T" ]; then
    start_bgm
fi