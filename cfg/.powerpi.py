#!/bin/python

import RPi.GPIO as GPIO
import time
import os

#gpio_pin_number=YOUR_CHOSEN_GPIO_NUMBER_HERE
#Replace YOUR_CHOSEN_GPIO_NUMBER_HERE with the GPIO pin number you wish to use
#Make sure you know which rapsberry pi revision you are using first
#The line should look something like this e.g. "gpio_pin_number=7"

GPIO.setmode(GPIO.BCM)

GPIO.setup(3, GPIO.IN, pull_up_down = GPIO.PUD_UP)

def Shutdown(channel):
	os.system("sudo systemctl poweroff")
	
GPIO.add_event_detect(3, GPIO.FALLING, callback = Shutdown, bouncetime = 2000)
while 1:
	time.sleep(1)
	
GPIO.cleanup()
#Revert all GPIO pins to their normal states (i.e. input = safe)

