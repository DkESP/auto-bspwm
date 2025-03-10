#!/usr/bin/bash

#___.            ________   __    ___________ ___________________
#\_ |__ ___.__.  \______ \ |  | __\_   _____//   _____/\______   \
# | __ <   |  |   |    |  \|  |/ / |    __)_ \_____  \  |     ___/
# | \_\ \___  |   |    `   \    <  |        \/        \ |    |
# |___  / ____|  /_______  /__|_ \/_______  /_______  / |____|
#     \/\/              \/     \/        \/        \/

# Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

#Variables
dir=$(pwd)
fdir="$HOME/.local/share/fonts"
user=$(whoami)

# CTRL C
trap ctrl_c INT

function ctrl_c(){
  echo -e "\n\n [!] Saliendo..."
  exit 1
} 

function banner(){
echo -e "${redColour}   _____          __                  __________  ___________________  __      __  _____    "
sleep 0.2
echo -e "  /  _  \  __ ___/  |_  ____          \______   \/   _____/\______   \/  \    /  \/     \   "
sleep 0.2
echo -e " /  /_\  \|  |  \   __\/  _ \   ______ |    |  _/\_____  \  |     ___/\   \/\/   /  \ /  \  "
sleep 0.2
echo -e "/    |    \  |  /|  | (  <_> ) /_____/ |    |   \/        \ |    |     \        /    Y    \ "
sleep 0.2
echo -e "\____|__  /____/ |__|  \____/          |______  /_______  / |____|      \__/\  /\____|__  / (By DkESP)"
sleep 0.2
echo -e "        \/                                    \/        \/                   \/         \/  "
echo -e "${endColour}"
}

if [ "$user" == "root" ]; then
  banner
  echo -e "\n\n${redColour}[!] Si estas en root se tensas, prueba como usuario no privilegiado.\n${endColour}"
  exit 1
else
  banner
  echo -e "\n${blueColour}[*] Starting installation of necessary dependencies for the environment...\n${endColour}"
  sleep 0.5 
  fi

  if [ $? != 0 ] && [ $? != 130 ]; then
    echo -e "\n${redColour}[-] Failed to install some dependencies for bspwm!\n${endColour}"
    exit 1
  else
    echo -e "\n\n${blueColour}[*] Installing necessary packages for the environment...\n${endColour}"
    sleep 2
  sudo apt install -y polybar zsh rofi feh xclip ranger fzf i3lock-fancy scrot scrub wmname imagemagick cmatrix htop neofetch python3-pip procps tty-clock lsd bat pamixer flameshot cava jq zsh-autocomplete zsh-autosuggestions zsh-syntax-highlighting 1>/dev/null
    if [ $? != 0 ] && [ $? != 130 ]; then
      echo -e "\n${redColour}[-] Failed to install some packages!\n${endColour}"
      exit 1
   else
      echo -e "\n${greenColour}[+] Done\n${endColour}"
      sleep 1.5
    fi
	
	echo -e "\n${blueColour}[*] Starting installation of necessary dependencies for the environment...\n${endColour}"
	sleep 0.5

	echo -e "\n${purpleColour}[*] Installing necessary dependencies for bspwm...\n${endColour}"
	sleep 2
	sudo apt install -y build-essential git vim xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev 1>/dev/null	
 	if [ $? != 0 ] && [ $? != 130 ]; then
		echo -e "\n${redColour}[-] Failed to install some dependencies for bspwm!\n${endColour}"
		exit 1
	else
		echo -e "\n${greenColour}[+] Done\n${endColour}"
		sleep 1.5
	fi

		echo -e "\n${purpleColour}[*] Installing necessary dependencies for polybar...\n${endColour}"
	sleep 2
	sudo apt install -y cmake cmake-data pkg-config python3-sphinx libcurl4 libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libnl-genl-3-dev 1>/dev/null
	
 	if [ $? != 0 ] && [ $? != 130 ]; then
		echo -e "\n${redColour}[-] Failed to install some dependencies for polybar!\n${endColour}"
		exit 1
	else
		echo -e "\n${greenColour}[+] Done\n${endColour}"
		sleep 1.5
	fi

	echo -e "\n${purpleColour}[*] Installing necessary dependencies for picom...\n${endColour}"
	sleep 2
	sudo apt install -y libconfig-dev libdbus-1-dev libegl-dev libev-dev libgl-dev libepoxy-dev libpcre3 libpcre3-dev libpcre2-dev libpixman-1-dev libx11-xcb-dev libxcb1-dev libxcb-composite0-dev libxcb-damage0-dev libxcb-glx0-dev libxcb-image0-dev libxcb-present-dev libxcb-randr0-dev libxcb-render0-dev libxcb-render-util0-dev libxcb-shape0-dev libxcb-util-dev libxcb-xfixes0-dev meson ninja-build uthash-dev 1>/dev/null
 	if [ $? != 0 ] && [ $? != 130 ]; then
		echo -e "\n${redColour}[-] Failed to install some dependencies for picom!\n${endColour}"
		exit 1
	else
		echo -e "\n${greenColour}[+] Done\n${endColour}"
		sleep 1.5
	fi


  echo -e "\n${blueColour}[*] Starting installation of the tools...\n${endColour}"
	sleep 0.5
	mkdir ~/tools && cd ~/tools

	echo -e "\n${purpleColour}[*] Installing bspwm...\n${endColour}"
	sleep 2
	git clone https://github.com/baskerville/bspwm.git 1>/dev/null
	cd bspwm
	make -j$(nproc) 1>/dev/null
	sudo make install 1>/dev/null
	if [ $? != 0 ] && [ $? != 130 ]; then
		echo -e "\n${redColour}[-] Failed to install bspwm!\n${endColour}"
		exit 1
	else
		sudo apt install bspwm -y 1>/dev/null
		echo -e "\n${greenColour}[+] Done\n${endColour}"
		sleep 1.5
	fi
	cd ..

	echo -e "\n${purpleColour}[*] Installing sxhkd...\n${endColour}"
	sleep 2
	git clone https://github.com/baskerville/sxhkd.git 1>/dev/null
	cd sxhkd 
	make -j$(nproc) 1>/dev/null
	sudo make install 1>/dev/null
	if [ $? != 0 ] && [ $? != 130 ]; then
		echo -e "\n${redColour}[-] Failed to install sxhkd!\n${endColour}"
		exit 1
	else
		echo -e "\n${greenColour}[+] Done\n${endColour}"
		sleep 1.5
	fi

	cd ..

	echo -e "\n${purpleColour}[*] Installing kitty...\n${endColour}"
	sleep 2
	wget https://github.com/kovidgoyal/kitty/releases/download/v0.40.0/kitty-0.40.0-x86_64.txz
	7z x kitty-0.40.0-x86_64.txz 1>/dev/null
 	mkdir kitty 
  	mv kitty-0.40.0-x86_64.tar kitty 1>/dev/null
  	cd kitty
	tar -xf kitty-0.40.0-x86_64.tar 1>/dev/null
 	cd /opt
	sudo cp -r /home/$user/tools/kitty . 1>/dev/null
	sudo cp -r $dir/config/kitty /root/.config/ 1>/dev/null
	cd /home/$user/tools/
	
	echo -e "\n${purpleColour}[*] Installing polybar...\n${endColour}"
	sleep 2
 	sudo cp $dir/fonts/fonts/* /usr/share/fonts/truetype/ 1>/dev/null
	if [ $? != 0 ] && [ $? != 130 ]; then
		echo -e "\n${redColour}[-] Failed to install polybar!\n${endColour}"
		exit 1
	else
		echo -e "\n${greenColour}[+] Done\n${endColour}"
		sleep 1.5
	fi

	echo -e "\n${purpleColour}[*] Installing picom...\n${endColour}"
	sleep 2
	git clone https://github.com/yshui/picom 1>/dev/null
	cd picom
	meson setup --buildtype=release build 1>/dev/null
	ninja -C build 1>/dev/null
	sudo ninja -C build install 1>/dev/null
	if [ $? != 0 ] && [ $? != 130 ]; then
		echo -e "\n${redColour}[-] Failed to install picom!\n${endColour}"
		exit 1
	else
		echo -e "\n${greenColour}[+] Done\n${endColour}"
		sleep 1.5
	fi

	cd ..

	echo -e "\n${purpleColour}[*] Installing Oh My Zsh and Powerlevel10k for user $user...\n${endColour}"
	sudo usermod --shell /usr/bin/zsh root 1>/dev/null
	sudo usermod --shell /usr/bin/zsh $user 1>/dev/null
 	sleep 2
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k 1>/dev/null
 	if [ $? != 0 ] && [ $? != 130 ]; then
		echo -e "\n${redColour}[-] Failed to install Oh My Zsh and Powerlevel10k for user $user!\n${endColour}"
		exit 1
	else
		echo -e "\n${greenColour}[+] Done\n${endColour}"
		sleep 1.5
	fi

	echo -e "\n${purpleColour}[*] Installing Oh My Zsh and Powerlevel10k for user root...\n${endColour}"
	sleep 2
	sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended 1>/dev/null
	sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /root/.oh-my-zsh/custom/themes/powerlevel10k 1>/dev/null
	if [ $? != 0 ] && [ $? != 130 ]; then
		echo -e "\n${redColour}[-] Failed to install Oh My Zsh and Powerlevel10k for user root!\n${endColour}"
		exit 1
	else
		echo -e "\n${greenColour}[+] Done\n${endColour}"
		sleep 1.5
	fi

	echo -e "\n${blueColour}[*] Starting configuration of fonts, wallpaper, configuration files, .zshrc, .p10k.zsh, and scripts...\n${endColour}"
	sleep 0.5

	echo -e "\n${purpleColour}[*] Configuring fonts...\n${endColour}"
	sleep 2
	if [[ -d "$fdir" ]]; then
		cp -rv $dir/fonts/* $fdir 1>/dev/null
	else
		mkdir -p $fdir 1>/dev/null
		cp -rv $dir/fonts/* $fdir 1>/dev/null
	fi
	echo -e "\n${greenColour}[+] Done\n${endColour}"
	sleep 1.5

	echo -e "\n${purpleColour}[*] Configuring wallpaper...\n${endColour}"
	sleep 2
	if [[ -d "~/Wallpapers" ]]; then
		cp -rv $dir/wallpapers/* ~/Wallpapers 1>/dev/null
	else
 		mkdir ~/Desktop/$user
		mkdir ~/Desktop/$user/fondos
		cp -rv $dir/wallpapers/* /home/$user/Desktop/$user/fondos 1>/dev/null
  		
	fi
	echo -e "\n${greenColour}[+] Done\n${endColour}"
	sleep 1.5

 	echo -e "\n${purpleColour}[*] Configuring fastfetch\n${endColour}"
 	wget https://github.com/fastfetch-cli/fastfetch/releases/download/2.37.0/fastfetch-linux-amd64.deb 1>/dev/null
  	sudo dpkg -i fastfetch-linux-amd64.deb 1>/dev/null
   	rm fastfetch-linux-amd64.deb 1>/dev/null
    	sleep 2
	echo -e "\n${purpleColour}[*] Configuring configuration files...\n${endColour}"
	sleep 2
	cp -rv $dir/config/* ~/.config/ 1>/dev/null
 	cd  ~/.config/bspwm/scripts
  	chmod +x *
   	cd ~/tools
	echo -e "\n${greenColour}[+] Done\n${endColour}"
	sleep 1.5

 	echo -e "\n${purpleColour}[*] Configuring nvim\n${endColour}"
	sudo apt remove -y neovim 1>/dev/null
 	wget https://github.com/neovim/neovim/releases/download/v0.10.4/nvim-linux-x86_64.tar.gz 1>/dev/null
	tar -xf nvim-linux-x86_64.tar.gz 1>/dev/null
 	sudo mkdir /opt/nvim 1>/dev/null
  	sudo cp -rv nvim-linux-x86_64 /opt/nvim/ 1>/dev/null
 	
 	echo -e "\n${purpleColour}[*] installing the sudo zsh plugin\n${endColour}"
	sudo mkdir /usr/share/zsh-sudo/ 1>/dev/null
 	sudo wget -P /usr/share/zsh-sudo/ https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/refs/heads/master/plugins/sudo/sudo.plugin.zsh 1>/dev/null
 	
	echo -e "\n${purpleColour}[*] Configuring the .zshrc and .p10k.zsh files...\n${endColour}"
	sleep 2
	cp -v $dir/.zshrc ~/.zshrc 1>/dev/null
	sudo ln -sfv ~/.zshrc /root/.zshrc 1>/dev/null
	cp -v $dir/.p10k.zsh ~/.p10k.zsh 1>/dev/null
 	sudo cp -v $dir/root/.p10k.zsh /root/.p10k.zsh 1>/dev/null
	echo -e "\n${greenColour}[+] Done\n${endColour}"
	sleep 1.5

	echo -e "\n${purpleColour}[*] Configuring scripts...\n${endColour}"
	sleep 2
	mkdir ~/.config/bin 
	touch  ~/.config/bin/target
	echo -e "\n${greenColour}[+] Done\n${endColour}"
	sleep 1.5

	echo -e "\n${purpleColour}[*] Configuring necessary permissions and symbolic links...\n${endColour}"
	sleep 2
	chmod -R +x ~/.config/bspwm/
	chmod +x ~/.config/polybar/launch.sh 1>/dev/null
	sudo chown root:root /usr/local/share/zsh/site-functions/_bspc 1>/dev/null
	cd ..
	echo -e "\n${greenColour}[+] Done\n${endColour}"
	sleep 1.5

	echo -e "\n${purpleColour}[*] Removing repository and tools directory...\n${endColour}"
	sleep 2
	rm -rfv ~/tools 1>/dev/null
	rm -rfv $dir 1>/dev/null
	echo -e "\n${greenColour}[+] Done\n${endColour}"
	sleep 1.5

	echo -e "\n${greenColour}[+] Environment configured :D\n${endColour}"
	sleep 1.5

	while true; do
		echo -en "\n${yellowColour}[?] It's necessary to restart the system. Do you want to restart the system now? ([y]/n) ${endColour}"
		read -r
		REPLY=${REPLY:-"y"}
		if [[ $REPLY =~ ^[Yy]$ ]]; then
			echo -e "\n\n${greenColour}[+] Restarting the system...\n${endColor}"
			sleep 1
			sudo reboot
		elif [[ $REPLY =~ ^[Nn]$ ]]; then
			exit 0
		else
			echo -e "\n${redColour}[!] Invalid response, please try again\n${endColour}"
		fi
	done
fi

