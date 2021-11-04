#!/bin/bash
# Start of Function Cluster
checkcompatibility () {
	# Set variables
	. /etc/os-release
	ispopos="false"
	kernelarch=$(uname -m)
	
	# Check distro
	if ! lsb_release -d | grep -qi '^Description:[[:space:]]*Pop!_OS *[0-9][0-9]*\.'
	then
		sysreqfail
	fi
	ispopos="true"
	
	# Function cluster for identifying codenames
	case "$UBUNTU_CODENAME" in
		"bionic") poposverno="18.04 LTS";;
		"focal") poposverno="20.04 LTS";;
		"groovy") poposverno="20.10";;
		"hirsute") poposverno="21.04";;
		*) poposverno="UNDEFINED, Contact maintainer";;
	esac
	# End cluster

	# Check for 20.04 and 21.04
	if ! grep -qie "focal" -e "hirsute" /etc/os-release
	then
		sysreqfail
	fi
	
	# Check kernel architecture
	if ! uname -m | grep -qi "x86_64"
	then
		sysreqfail
	fi
}
sysreqfail () {
	clear
	tput setaf 9
	echo "System requirements not met. This script supports x86_64 versions of Pop!_OS with versions 20.04 LTS and 21.04!!!"
	tput setaf 3
	echo "If your error is not caused by a wrong Pop!_OS version or OS architecture, please check to see if I have published a script for your system."
	tput setaf 10
	echo "Your current distro is $PRETTY_NAME."
	# Display Pop!_OS codename if Pop!_OS
	if echo $ispopos | grep -qi "true"
	then
		echo "Your current Pop!_OS version is $poposverno (Codename: $UBUNTU_CODENAME)."
	fi
	echo "Your current OS architecture is $kernelarch."
	tput sgr0
	echo "Hit any key to exit:"
	IFS=""
	read -sN1 answer
	quitscript
}
mainmenu () {
	clear
 	tput setaf 3
	echo "===================================="
	echo " --- Pop!_OS Setup Script 4.2.1 ---"
	echo "===================================="
	echo "Supported Pop!_OS Versions (x86_64): 20.04 LTS, 21.04"
	tput setaf 10
	echo "Your current distro is $PRETTY_NAME."
	echo "Your current Pop!_OS version is $poposverno (Codename: $UBUNTU_CODENAME)."
	echo "Your current OS architecture is $kernelarch."
	tput setaf 3
	echo "Script may prompt you or ask you for your password once in a while. Please monitor your computer until the script is done."
	echo "This script will show terminal output. This is normal."
	echo "You can open this script in a text editor to see packages to be installed in detail."
	tput setaf 10
	echo "You are encouraged to modify this script for your own needs."
	tput setaf 9
	echo "System will automatically reboot after the script is run!!!"
	echo "It is not recommended to run this script more than once unless after a distro upgrade!!!"
	echo "Make sure you have a stable and fast Internet connection before proceeding!!!"
	tput setaf 3
	echo "Press 1 to perform a Full Install (All User Packages)"
	echo "Press 2 to perform a Minimal Install (Essentials)"
	tput setaf 9
	echo "Press Q to quit"
	tput sgr0
	echo "Enter your selection:"
	IFS=""
	read -sN1 answer
	case $(echo "$answer" | tr A-Z a-z) in
		1)	full;;
		2)	minimal;;
		q)	quitscript;;
		*)	badoption;;
	esac
}
quitscript () {
	tput sgr0
	clear
	exit
}
badoption () {
	clear
	tput setaf 9
	echo "Invalid Option!"
	tput setaf 3
	echo "Returning to Main Menu..."
	tput sgr0
	sleep 3
	mainmenu
}
finish () {
	clear
	tput setaf 10
	echo "Done..."
	tput setaf 9
	echo "Rebooting..."
	tput sgr0
	sleep 3
	clear
	sudo reboot
}
full () {
	clear
	tput setaf 3
	echo "Full Install/All User Packages..."
	tput sgr0
	sleep 3
	clear
	common
	sudo apt install -y ubuntu-restricted-extras gnome-backgrounds ubuntu-gnome-wallpapers system76-wallpapers synaptic remmina bleachbit frozen-bubble musescore3 asunder brasero k3b pavucontrol pulseeffects rhythmbox shotwell solaar gnome-boxes gparted vlc p7zip-full p7zip-rar gnome-tweaks lame gpart grub2-common neofetch network-manager-openvpn-gnome ffmpeg webhttrack lsp-plugins tree telegram-desktop gufw easytag android-tools-adb android-tools-fastboot gnome-sound-recorder cheese nikwi supertux dconf-editor deja-dup gnome-todo gnome-sushi unoconv ffmpegthumbs fonts-cantarell gnome-books krita gnome-clocks gimp htop transmission curl git handbrake gtk-3-examples menulibre nautilus-admin python3-pip
	sudo apt install -y libc6-i386 libx11-6:i386 libegl1-mesa:i386 zlib1g:i386 libstdc++6:i386 libgl1-mesa-dri:i386 libasound2:i386 libpulse0:i386
	sudo add-apt-repository -y ppa:linuxuprising/java
	echo oracle-java16-installer shared/accepted-oracle-license-v1-2 select true | sudo /usr/bin/debconf-set-selections
	sudo apt install -y oracle-java16-installer --install-recommends
	java -version
	sleep 3
	sudo add-apt-repository -y ppa:mkusb/ppa
	sudo apt install -y mkusb mkusb-nox usb-pack-efi gparted
	sudo add-apt-repository -y ppa:obsproject/obs-studio
	sudo apt install -y obs-studio
	sudo add-apt-repository -y ppa:nextcloud-devs/client
	sudo apt install -y nextcloud-client
	sudo apt update -y
	sudo apt full-upgrade -y --allow-downgrades
	sudo apt autoremove -y --purge
	sudo apt autoclean -y
	flatpak install -y flathub org.audacityteam.Audacity
	flatpak install -y flathub org.shotcut.Shotcut
	flatpak install -y flathub net.minetest.Minetest
	flatpak update -y
	flatpak uninstall -y --unused
	pip3 install pip youtube-dl yt-dlp speedtest-cli -U
	echo "Adding current user to cdrom group..."
	sudo usermod -aG cdrom $USER
	echo "Patching LSP icons..."
	mkdir ~/.local/share/applications
	echo "[Desktop Entry]
	Hidden=true" > /tmp/1
	find /usr -name "*lsp_plug*desktop" 2>/dev/null | cut -f 5 -d '/' | xargs -I {} cp /tmp/1 ~/.local/share/applications/{}
	finish
}
minimal () {
	clear
	tput setaf 3
	echo "Minimal Install/Essentials..."
	tput sgr0
	sleep 3
	clear
	common
	sudo apt install -y ubuntu-restricted-extras synaptic pavucontrol rhythmbox gparted p7zip-full p7zip-rar gnome-tweaks gpart network-manager-openvpn-gnome ffmpeg gufw dconf-editor deja-dup gnome-sushi unoconv ffmpegthumbs fonts-cantarell htop curl git gtk-3-examples menulibre nautilus-admin python3-pip
	sudo apt install -y libc6-i386 libx11-6:i386 libegl1-mesa:i386 zlib1g:i386 libstdc++6:i386 libgl1-mesa-dri:i386 libasound2:i386 libpulse0:i386
	sudo apt update -y
	sudo apt full-upgrade -y --allow-downgrades
	sudo apt autoremove -y --purge
	sudo apt autoclean -y
	flatpak update -y
	flatpak uninstall -y --unused
	pip3 install pip speedtest-cli -U
	finish
}
common () {
	sudo apt update -y
	sudo apt install -y gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-plugins-good libavcodec-extra gstreamer1.0-libav chromium-codecs-ffmpeg-extra libdvd-pkg
	sudo dpkg-reconfigure libdvd-pkg
}
# End of Function Cluster
# Start of Main Script
while true
do
	checkcompatibility
	mainmenu
done
# End of Main Script
