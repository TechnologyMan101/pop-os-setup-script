#!/bin/bash
clear
# Start of Function Cluster
tput setaf 3
echo "Initializing functions..."
sleep 1.5
tput setaf 10
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
		"bionic")	poposverno="18.04 LTS";;
		"focal")	poposverno="20.04 LTS";;
		"groovy")	poposverno="20.10";;
		"hirsute")	poposverno="21.04";;
		"impish")	poposverno="21.10";;
        "jammy")    poposverno="22.04 LTS";;
		*)	poposverno="UNDEFINED, Contact maintainer";;
	esac
	# End cluster

	# Check for 22.04 LTS
	if ! grep -qi "jammy" /etc/os-release
	then
		sysreqfail
	fi
	
	# Check kernel architecture
	if ! uname -m | grep -qi "x86_64"
	then
		sysreqfail
	fi
}
echo "Loaded checkcompatibility."
sysreqfail () {
	clear
	tput setaf 9
	echo "System requirements not met. This script supports x86_64 versions of Pop!_OS 22.04 LTS!!!"
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
echo "Loaded sysreqfail."
mainmenu () {
	clear
 	tput setaf 3
	echo "=================================="
	echo " --- Pop!_OS Setup Script 5.2 ---"
	echo "=================================="
	echo "Supported Pop!_OS Versions (x86_64): 22.04 LTS"
	tput setaf 10
	echo "Your current distro is $PRETTY_NAME."
	echo "Your current Pop!_OS version is $poposverno (Codename: $UBUNTU_CODENAME)."
	echo "Your current OS architecture is $kernelarch."
	tput setaf 3
	echo "Script may prompt you or ask you for your password once in a while. Please monitor your computer until the script is done."
	echo "This script will show terminal output. This is normal."
	echo "You can open this script in a text editor to view all functions."
	tput setaf 10
	echo "You are encouraged to modify this script for your own needs."
	tput setaf 9
	echo "System will automatically reboot after the script is run!!!"
	echo "It is not recommended to run this script more than once!!!"
	tput setaf 10
	echo "You may run this script again after a failure, an upgrade, or to get your system up-to-date with the latest version of my script."
	tput setaf 9
	echo "Make sure you have a stable and fast Internet connection before proceeding!!!"
	tput setaf 3
	echo "Press 1 to perform a Full Install (All User Packages)"
	echo "Press 2 to perform a Minimal Install (Essentials)"
	echo "Press 3 to view instructions for setting up a multi-user system"
	tput setaf 9
	echo "Press Q to quit"
	tput sgr0
	echo "Enter your selection:"
	IFS=""
	read -sN1 answer
	case $(echo "$answer" | tr A-Z a-z) in
		1)	full;;
		2)	minimal;;
		3)	multiusermenu;;
		q)	quitscript;;
		*)	badoption;;
	esac
}
echo "Loaded mainmenu."
multiusermenu () {
	clear
 	tput setaf 3
	echo "==========================================="
	echo " --- Instructions for Multi-User Setup ---"
	echo "==========================================="
	tput setaf 9
	echo "If you want to set up multiple user accounts on your computer, please run the script again on each new user account. Make sure that additional user accounts are set to Administrator. You can set accounts back to Standard after completing setup."
	tput sgr0
	echo "Hit any key to return to the main menu:"
	IFS=""
	read -sN1 answer
	mainmenu
}
echo "Loaded multiusermenu."
quitscript () {
	tput sgr0
	clear
	exit
}
echo "Loaded quitscript."
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
echo "Loaded badoption."
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
echo "Loaded finish."
full () {
	clear
	tput setaf 3
	echo "Full Install/All User Packages..."
	tput sgr0
	sleep 3
    clear
	common
	runcheck sudo apt install -y ubuntu-restricted-extras gnome-backgrounds ubuntu-gnome-wallpapers system76-wallpapers synaptic remmina bleachbit frozen-bubble musescore3 asunder brasero k3b pavucontrol rhythmbox shotwell solaar gnome-boxes gparted vlc p7zip-full p7zip-rar gnome-tweaks lame gpart grub2-common neofetch network-manager-openvpn-gnome ffmpeg webhttrack lsp-plugins tree telegram-desktop gufw easytag android-tools-adb android-tools-fastboot gnome-sound-recorder cheese nikwi supertux dconf-editor deja-dup gnome-todo gnome-sushi unoconv ffmpegthumbs fonts-cantarell gnome-books krita gnome-clocks gimp htop curl git handbrake gtk-3-examples menulibre nautilus-admin python3-pip libreoffice-style-sukapura cpu-x hardinfo bijiben mcomix gscan2pdf supertuxkart unzip
	runcheck sudo apt install -y libc6-i386 libx11-6:i386 libegl1-mesa:i386 zlib1g:i386 libstdc++6:i386 libgl1-mesa-dri:i386 libasound2:i386
	runcheck sudo add-apt-repository -y ppa:linuxuprising/java
	runcheck sudo apt install -y oracle-java17-installer --install-recommends
	java -version
	sleep 3
	runcheck sudo add-apt-repository -y ppa:mkusb/ppa
	runcheck sudo apt install -y mkusb mkusb-nox usb-pack-efi gparted
	runcheck sudo add-apt-repository -y ppa:obsproject/obs-studio
	runcheck sudo apt install -y obs-studio
	runcheck sudo apt update -y
	runcheck sudo apt full-upgrade -y --allow-downgrades
	runcheck sudo apt autoremove -y --purge
	runcheck sudo apt autoclean -y
	runcheck flatpak install -y flathub org.audacityteam.Audacity
	runcheck flatpak install -y flathub org.shotcut.Shotcut
	runcheck flatpak install -y flathub net.minetest.Minetest
	runcheck flatpak install -y flathub org.inkscape.Inkscape
	runcheck flatpak install -y flathub ar.xjuan.Cambalache
	runcheck flatpak install -y flathub com.github.jeromerobert.pdfarranger
	runcheck flatpak install -y flathub com.github.muriloventuroso.pdftricks
	runcheck flatpak install -y flathub org.kde.okular
	runcheck flatpak install -y flathub com.github.flxzt.rnote
	runcheck flatpak install -y flathub com.github.tchx84.Flatseal
	runcheck flatpak install -y flathub com.mattjakeman.ExtensionManager
	runcheck flatpak install -y flathub com.github.wwmm.easyeffects
	runcheck flatpak install -y flathub com.wps.Office
	runcheck flatpak install -y flathub app.drey.EarTag
	runcheck flatpak install -y flathub de.haeckerfelix.Fragments
	runcheck flatpak uninstall -y --unused --delete-data
	runcheck pip3 install pip wheel youtube-dl yt-dlp speedtest-cli mangadex-downloader[optional] animdl -U
	runcheck pip3 cache purge
	echo "Adding current user to cdrom group..."
	runcheck sudo usermod -aG cdrom $USER
	echo "Patching LSP icons..."
    # The next command makes sure the directory exists. It is normal for it to fail. Runcheck is not needed here. 
	mkdir ~/.local/share/applications
	runcheck echo "[Desktop Entry]
	Hidden=true" > /tmp/1
	runcheck find /usr -name "*lsp_plug*desktop" 2>/dev/null | cut -f 5 -d '/' | xargs -I {} cp /tmp/1 ~/.local/share/applications/{}
	autofontinstall
	finish
}
echo "Loaded full."
minimal () {
	clear
	tput setaf 3
	echo "Minimal Install/Essentials..."
	tput sgr0
	sleep 3
	clear
	common
	runcheck sudo apt install -y ubuntu-restricted-extras synaptic pavucontrol rhythmbox gparted p7zip-full p7zip-rar gnome-tweaks gpart network-manager-openvpn-gnome ffmpeg gufw dconf-editor deja-dup gnome-sushi unoconv ffmpegthumbs fonts-cantarell htop curl git gtk-3-examples menulibre nautilus-admin python3-pip libreoffice-style-sukapura cpu-x hardinfo bijiben gscan2pdf unzip
	runcheck sudo apt install -y libc6-i386 libx11-6:i386 libegl1-mesa:i386 zlib1g:i386 libstdc++6:i386 libgl1-mesa-dri:i386 libasound2:i386
	runcheck sudo apt update -y
	runcheck sudo apt full-upgrade -y --allow-downgrades
	runcheck sudo apt autoremove -y --purge
	runcheck sudo apt autoclean -y
	runcheck flatpak install -y flathub com.github.jeromerobert.pdfarranger
	runcheck flatpak install -y flathub com.github.muriloventuroso.pdftricks
	runcheck flatpak install -y flathub org.kde.okular
	runcheck flatpak install -y flathub com.github.tchx84.Flatseal
	runcheck flatpak install -y flathub com.mattjakeman.ExtensionManager
	runcheck flatpak install -y flathub com.github.wwmm.easyeffects
	runcheck flatpak install -y flathub com.wps.Office
	runcheck flatpak update -y
	runcheck flatpak uninstall -y --unused --delete-data
	runcheck pip3 install pip wheel speedtest-cli -U
    runcheck pip3 cache purge
	echo "Patching LSP icons..."
    # The next command makes sure the directory exists. It is normal for it to fail. 
	mkdir ~/.local/share/applications
    runcheck echo "[Desktop Entry]
	Hidden=true" > /tmp/1
	runcheck find /usr -name "*lsp_plug*desktop" 2>/dev/null | cut -f 5 -d '/' | xargs -I {} cp /tmp/1 ~/.local/share/applications/{}
	autofontinstall
	finish
}
echo "Loaded minimal."
common () {
	runcheck sudo apt update -y
	runcheck sudo apt install -y gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-plugins-good libavcodec-extra gstreamer1.0-libav chromium-codecs-ffmpeg-extra libdvd-pkg libheif1 libquicktime2 heif-gdk-pixbuf
	runcheck sudo dpkg-reconfigure libdvd-pkg
}
echo "Loaded common."
autofontinstall () {
	echo "Installing the Essential Font Pack..."
	runcheck sudo wget -O "/tmp/fontinstall.zip" "https://github.com/TechnologyMan101/script-extras/releases/download/20221012-1521/Essential.Font.Pack.zip"
	runcheck sudo unzip -o "/tmp/fontinstall.zip" -d "/usr/share/fonts"
	runcheck sudo chmod -R 755 "/usr/share/fonts/Essential Font Pack"
	runcheck sudo rm "/tmp/fontinstall.zip"
}
echo "Loaded autofontinstall."
runcheck () {
	IFS=$'\n'
	command="$*"
	retval=1
	attempt=1
	until [[ $retval -eq 0 ]] || [[ $attempt -gt 5 ]]; do
		(
			set +e
			$command
		)
		retval=$?
		attempt=$(( $attempt + 1 ))
		if [[ $retval -ne 0 ]]; then
			clear
			tput setaf 9
			echo "Oops! Something went wrong! Retrying in 3 seconds..."
			tput sgr0
			sleep 3
			clear
		fi
	done
	if [[ $retval -ne 0 ]] && [[ $attempt -gt 5 ]]; then
		clear
		tput setaf 9
		echo "Oops! A fatal error has occurred and the program cannot continue. Returning to the main menu in 10 seconds..."
		tput setaf 3
		echo "Please try again later or if the problem persists, create an issue on GitHub."
		tput sgr0
		sleep 10
		clear
		mainmenu
	fi
	IFS=""
}
echo "Loaded runcheck."
tput setaf 3
echo "Continuing..."
tput sgr0
sleep 1.5
# End of Function Cluster
# Start of Main Script
while true
do
	checkcompatibility
	mainmenu
done
# End of Main Script
