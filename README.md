# The Eazy Hax RetroPie Toolkit
I have spent an insane amount of time developing and maintaining this kit over the past two years for you guys and its been a blast! Due to changes that the team at RetroPie and Raspberry Pi have made to the OS the scripts require regular maintenance to function reliably....so update your scripts often or make sure you subscribe to my channel and enable notifications so you don't miss out! 

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
