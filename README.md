# The Eazy Hax RetroPie Toolkit
I have spent an insane amount of time developing and maintaining this kit over the past two years for you guys and its been a blast! Due to changes that the team at RetroPie and Raspberry Pi have made to the OS the scripts require regular maintenance to function reliably....so update your scripts often or make sure you subscribe to my channel and enable notifications so you don't miss out! 

# The Scripts and what they do....  
1. [Add Video Splash Screens](#add-video-sphlashscreens)  
1. [Disk Space](#disk-space)  
1. [Expand to External Drive Enable/Disable](#expand-to-external-hard-drive-enabledisable)  

# Install Instructions
1. [Enable SSH (Required for Windows or Mac users)](#enable-ssh-required-for-windows-or-mac-users)
2. [Install the Kit (Windows)](#install-the-kit-windows)
3. [Install the Kit (Mac)](#install-the-kit-mac)


## Install the toolkit to run through the RetroPie Menu on the pi itself
### Enable SSH (Required for Windows or Mac users)

First your RetroPie must be connected to the internet through your home network so you can
A. Connect to your Pi 
B. Download the toolkit and config file

Now on with enabling ssh.....

1. Go to the RetroPie Menu and select Raspi-config
![Screenshot](/images/ssh1.JPG)
2. Navigate to Interface Options
![Screenshot](/images/ssh2.JPG)
3. Select SSH
![Screenshot](/images/ssh3.JPG)
4. Select Yes
![Screenshot](/images/ssh4.PNG)

### Install the Kit (Windows)

Download the Windows Kit [HERE](http://eazyhax.com/pitime/retropie_toolkit_v2/RetroPie%20Toolkit.zip)
1. Extract the toolkit and put the "RetroPie Toolkit" directory where ever you like
![Screenshot](/images/windows1.PNG)
1. Launch the "Install Eazy Hax Toolit on the Pi.cmd".
![Screenshot](/images/windows2.PNG)
1. If this is your first time launching one of the scripts in the toolkit then windows will give you a warning. (Dont worry...I wrote all these myself and they are harmless) Click "More Info"  
![Screenshot](/images/windows3.PNG)
1. Next Click "Run anyway"  
![Screenshot](/images/windows4.PNG)
1. A screen will pop up with text showing you the status of the install and informing you that your pi will be rebooted so the scripts show up.   
![Screenshot](/images/windows5.PNG)  
Thats it! When your pi comes back online you should see a new menu item Eazy Hax Toolkit under the RetroPie Menu.  
![Screenshot](/images/eazyhaxtoolkit.png)  
  
  
### Install the Kit (Mac)
1. Press Super (apple button) and spacebar to bring up spotlight. Type in "terminal"
![Screenshot](/images/mac1.png)  
1. Highlight, copy and paste the below line into the terminal (Super + c to copy; Super + v to paste)  
```ssh retropie -l pi```  
![Screenshot](/images/mac2.png)  
Just type yes and hit enter if you get the dialog above.  
1. Next put in the password `raspberry` when prompted and hit enter
![Screenshot](/images/mac3.png)  
1. To start the install highlight, copy and paste the below line into the terminal (Super + c to copy; Super + v to paste)  
```curl https://raw.githubusercontent.com/Shakz76/Eazy-Hax-RetroPie-Toolkit/master/cfg/Install%20Eazy%20Hax%20RetroPie%20Toolkit.sh | bash```
![Screenshot](/images/mac4.png)  
1. You will then see text showing you the status of the install and informing you that your pi will be rebooted so the scripts show up.  
![Screenshot](/images/mac5.png)    
Thats it! When your pi comes back online you should see a new menu item Eazy Hax Toolkit under the RetroPie Menu.  
![Screenshot](/images/eazyhaxtoolkit.png)  

# The Scripts and what they do...
### Add Video Sphlashscreens
A simple script to install a set of my favorite video splashscreens.  
[![](http://img.youtube.com/vi/4uWfP_HJuLY/0.jpg)](https://www.youtube.com/watch?v=4uWfP_HJuLY)  
### Disk Space
Simply tells you how much space you have available on your SD card and **IF** you have used my "Expand to External Drive" scripts...how much space is on your external drive as well.  
![Screenshot](/images/diskspace.png)  
### Expand to External Hard Drive Enable/Disable
I tried to make this functionality as convenient for you as possible and this is probably the most complex script in my arsenal.  
**The Eazy Hax expand script IS NOT** the same thing that RetroPie already does. The RetroPie scripts are well made as is everything RetroPie does. The built in RetroPie scripts simply copy your /home/pi/RetroPie directory to your external drive and create a link to it. You have to wait for the games to copy over (takes ages on USB 2.0) and if you disconnect your USB drive you loose all of your games. If you want to use the RetroPie method...please do so.  
**What The Eazy Hax Expand Script does:**
* Copies everything you have on your sd card to a different directory on the SD card...**not** on the External drive.
* Mounts your external drive and make it mount permanently (even after reboots), and creates a roms directory on it that mimics what is on your sd card (just empty directories)
* Makes the pi think your sd card roms directory and anything you add to the external drive roms are one roms directory. This makes your Retropie read games from both your sd card and the exteral drive at the same time.
* Allows you to disconnect the external drive at any time and go mobile with the roms on your sd card....when you get back home...plug it up and you get the extended library on your External drive.
* Adds two separate samba (the way you connect to your Pi via Windows Explorer) directories one for the SD card and one for the External drive so you can add roms where you want them  via the network.
* Because the Eazy Hax method does not actually copy anything...no need to wait for the roms to be copied to the external drive. The expansion is nearly instant...plus it does not waste that space.
* The final benifit to this method is you can disconnect your External drive at any time, and plug it into your PC to load a large amount of roms saving you a ton of time. As many of you already know it takes quite a bit of time to copy the bigger CD/DVD based games to your Pi via the network. 
**NOTE:**If you for whatever reason have the exact same copy of a game on the SD card and the External drive it will read what is on the SD card and ignore what is on the External Drive.  
**The only rules are**
* The External drive must be formatted to NTFS
* Only one external drive **at a time** is supported. That said you can have 2 external drives...one with lets say your PS1 library and one with your Dreamcast library. You only need to run the Expand to External Drive Disable script, plug in your alternate drive, and run the expand script.
