# pop-os-setup-script
Bash script to set up a fresh install of Pop!_OS.


# Documentation

Version 3.11

Supported Pop!_OS Versions: 20.04 LTS, 20.10

**Please Run Script After Following Instructions Here**

**The Extras folder also contains other tools you may want including font packs.**

Please install .deb files and files using other types of installation formats using files manually (if you have them).

Please copy the Essential Font Pack from Extras at https://mega.nz/folder/cRZTkAJD#dV8CG6th0a-10Fu6yCG-5Q into `/usr/share/fonts/` Use `sudo nautilus` to open the file manager as root. This is required to perform these actions as this is modifying files on the system level. Before copying the font pack to the fonts folder, check that the folder permissions are all on “Create and delete files.”

Please add yourself to `vboxusers` using `sudo usermod -aG vboxusers $USER` and then reboot. Only do this if you have VirtualBox installed.


# Keyboard Shortcuts:

Change “Settings” to “Super+I”

Change “Toggle Fullscreen Mode” to “Super+F11”

Add shortcut to open “gnome-system-monitor” with “Super+Backspace”

Refer to image for media controls on desktop keyboards.


# Media Shortcuts Image:
![Error](https://raw.githubusercontent.com/TechnologyMan101/pop-os-setup-script/master/Media_Shortcuts_Desktop_Pop.png)


# VM Users

Minimal Install is recommended. VM Tools can be found at  https://mega.nz/folder/cRZTkAJD#dV8CG6th0a-10Fu6yCG-5Q in Extras.
