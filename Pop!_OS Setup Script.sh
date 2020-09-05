#!/bin/bash
while true
do
	clear # clear screen for each loop of menu
 	tput setaf 3
	echo "=================================="
	echo " --- Pop!_OS Setup Script 2.3 ---"
	echo "=================================="
	echo "Supported Pop!_OS Versions: 20.04 LTS"
	tput setaf 2; echo "Script created by Nathan Viroonchatapan."
	tput setaf 2; echo "All due credit and respect to Tyler Broad, for his work on the Release 2 codebase."
	tput setaf 3; echo "You can open this script in a text editor to see packages to be installed in detail."
	tput setaf 3; echo "Press 1 to install all packages in the script (Full Install/All User Packages)"
	echo "Press 2 to install only the base packages in the script (Minimal Install/Essentials)"
	tput setaf 1; echo "Press Q to quit"
	tput setaf 3; echo "Enter your selection here and hit <return>..."
	tput setaf 1; echo "System will automatically reboot after the script is run!!!"
	tput setaf 1; echo "It is not recommended to run this script more than once!!!"
	tput sgr0
	read answer
	case "$answer" in
		1) clear; echo "Full Install/All User Packages..."; sleep 5; sudo apt update -y; sudo apt install -y ubuntu-restricted-extras gnome-backgrounds ubuntu-gnome-wallpapers system76-wallpapers synaptic remmina bleachbit frozen-bubble musescore3 asunder brasero k3b pavucontrol pulseeffects rhythmbox shotwell solaar gnome-boxes gparted vlc p7zip-full p7zip-rar gnome-tweaks lame gpart speedtest-cli grub2-common neofetch network-manager-openvpn-gnome ffmpeg httraqt lsp-plugins tree audacity telegram-desktop gufw easytag android-tools-adb android-tools-fastboot gnome-sound-recorder cheese nikwi supertux dconf-editor deja-dup gnome-todo pitivi gnome-sushi unoconv fonts-cantarell gnome-books; sudo apt install -y gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-plugins-good libavcodec-extra gstreamer1.0-libav chromium-codecs-ffmpeg-extra libdvd-pkg; sudo dpkg-reconfigure libdvd-pkg; sudo apt install -y libc6-i386 libx11-6:i386 libegl1-mesa:i386 zlib1g:i386 libstdc++6:i386 libgl1-mesa-dri:i386 libasound2:i386 libpulse0:i386; sudo add-apt-repository -y ppa:linuxuprising/java; sudo apt install -y oracle-java14-installer; java --version; sleep 5; java -version; sleep 5; sudo add-apt-repository -y ppa:mkusb/ppa; sudo apt install -y mkusb mkusb-nox usb-pack-efi gparted; sudo add-apt-repository -y ppa:obsproject/obs-studio; sudo apt install -y obs-studio; sudo add-apt-repository -y ppa:minetestdevs/stable; sudo apt install -y minetest; curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - ; echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list; sudo apt update -y; sudo apt install -y spotify-client; sudo apt update -y; sudo apt full-upgrade -y; sudo apt autoremove -y; sudo apt autoclean -y; sudo usermod -a -G cdrom $USER; echo "Rebooting..."; sleep 5; sudo reboot;;
		2) clear; echo "Minimal Install/Essentials..."; sleep 5; sudo apt update -y; sudo apt install -y ubuntu-restricted-extras synaptic pavucontrol rhythmbox gparted p7zip-full p7zip-rar gnome-tweaks gpart network-manager-openvpn-gnome ffmpeg gufw dconf-editor deja-dup gnome-sushi unoconv fonts-cantarell; sudo apt install -y gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-plugins-good libavcodec-extra gstreamer1.0-libav chromium-codecs-ffmpeg-extra libdvd-pkg; sudo dpkg-reconfigure libdvd-pkg; sudo apt install -y libc6-i386 libx11-6:i386 libegl1-mesa:i386 zlib1g:i386 libstdc++6:i386 libgl1-mesa-dri:i386 libasound2:i386 libpulse0:i386; sudo apt update -y; sudo apt full-upgrade -y; sudo apt autoremove -y; sudo apt autoclean -y; echo "Rebooting..."; sleep 5; sudo reboot;;
		q) exit;;
		Q) exit;;
	esac
	tput setaf 3; echo "Hit the <return> key to finish..."
	tput sgr0
	read answer
	exit
done
