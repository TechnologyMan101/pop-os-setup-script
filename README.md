# Pop!_OS Setup Script
Bash script to set up a fresh install of Pop!_OS.


# Documentation

Version 5.24

Supported Pop!_OS Versions: 22.04 LTS

Recommended Free Space: 40 GB

**Please Run Script After Following Instructions Here**

<ins>_**Make sure to update your system using the system’s software center and reboot before performing any tasks here and running the script. Failing to do so may result in severe breakage!!!**_</ins>

**The Extras folder also contains other tools you may want.**

Please install .deb files and files using other types of installation formats using files manually (if you have them).

Please add yourself to `vboxusers` using `sudo usermod -aG vboxusers $USER` and then reboot. Only do this if you have VirtualBox installed. Since VirtualBox is installed as a DEB package on this distro, make sure to run it before the script and after installing VirtualBox if you choose to install VirtualBox. 


# Keyboard Shortcuts:

Change “Settings” to “Super+I”

Change “Toggle Fullscreen Mode” to “Super+F11”

Add shortcut to open “gnome-system-monitor” with “Super+Backspace”

Refer to image for media controls on desktop keyboards.


# Run Script:

Mark the script as executable by changing it in file properties or running `chmod +x /path/to/file`. Then run it in Terminal with `bash /path/to/file`


# GNOME Extensions:

This is to be done after running the script!!!

Install using Extension Manager. 

- Caffeine - eon (disable Notifications)
- Lock Keys - kazimieras.vaina (set Indicator Style to Show/Hide)


# Media Shortcuts Image:
![Error](https://raw.githubusercontent.com/TechnologyMan101/pop-os-setup-script/master/Media_Shortcuts_Desktop_Pop.png)


# VM Users

Minimal Install is recommended. VM Tools can be found at https://mega.nz/folder/sBwwxBTR#zf6d3UaJYnNGl5tXaN63ag in Extras or at https://github.com/TechnologyMan101/script-extras/releases.


# Other Notes

NVIDIA users must install Pop!_OS using the NVIDIA ISO. 
