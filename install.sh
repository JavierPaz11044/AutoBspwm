#!/bin/bash

if [ "$(whoami)" == "root" ]; then
    exit 1
fi

ruta=$(pwd)
 

sudo apt update

sudo apt install -y xorg lightdm bspwm sxhkd kitty 

if ! command -v bspwm >/dev/null 2>&1 || ! command -v sxhkd >/dev/null 2>&1; then

	echo "ERROR: bspwm o sxhkd no estan instalados (revisa salida de apt y /etc/apt/sources.list)." >&2

	exit 1

fi

# Instalando dependencias de Entorno

# sudo apt install -y build-essential git vim libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev

#     # xcb (No funciona por ahora)

# # Instalando Requerimientos para la polybar

# sudo apt install -y polybar cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libuv1-dev libnl-genl-3-dev

# # Dependencias de Picom

# sudo apt install -y meson ninja-build picom libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev libxcb-glx0-dev libpcre3 libpcre3-dev

# # Instalamos paquetes adionales

# sudo apt install -y kitty feh scrot scrub rofi xclip bat locate ranger wmname acpi imagemagick cmatrix zenity neofetch libnotify-bin lightdm lightdm-gtk-greeter

# LightDM reads /usr/share/xsessions/*.desktop — ensure BSPWM is listed if the package skipped it

BSPWM_XSESSION="/usr/share/xsessions/bspwm.desktop"

if [[ ! -f "$BSPWM_XSESSION" ]]; then

	sudo tee "$BSPWM_XSESSION" >/dev/null <<'EOF'
[Desktop Entry]
Name=bspwm
Comment=Binary space partitioning window manager
TryExec=bspwm
Exec=bspwm
Type=XSession
EOF

fi
#Create folder neccesary for the config files
mkdir -p .config

#Laod condig to sxhkd and bspwm

mv ./Config/bspwm ~/.config/
mv ./Config/sxhkd ~/.config/

# Creando carpeta de Reposistorios

# mkdir ~/github

# # Descargar Repositorios Necesarios

# cd ~/github
# git clone --recursive https://github.com/polybar/polybar
# git clone https://github.com/ibhagwan/picom.git

# # Instalando Polybar

# cd ~/github/polybar
# mkdir build
# cd build
# cmake ..
# make -j$(nproc)
# sudo make install

# # Instalando Picom (meson + ninja-build must be on PATH; ninja is from package ninja-build)

# cd ~/github/picom
# git submodule update --init --recursive
# sudo apt install -y meson ninja-build
# meson --buildtype=release . build
# ninja -C build
# sudo ninja -C build install

# # Instalando p10k

# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
# echo 'source ~/.powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

# # Instalando p10k root

# sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /root/.powerlevel10k

# # Configuramos el tema Nord de Rofi:

# mkdir -p ~/.config/rofi/themes
# cp $ruta/rofi/nord.rasi ~/.config/rofi/themes/

# # Instando lsd

# sudo dpkg -i $ruta/lsd.deb

# # Instalamos las HackNerdFonts

# sudo cp -v $ruta/fonts/HNF/* /usr/local/share/fonts/

# # Instalando Fuentes de Polybar

# sudo cp -v $ruta/Config/polybar/fonts/* /usr/share/fonts/truetype/

# # Instalando Wallpaper de S4vitar

# mkdir ~/Wallpaper
# cp -v $ruta/Wallpaper/* ~/Wallpaper
# mkdir ~/ScreenShots

# # Copiando Archivos de Configuración

# rm -r ~/.config/polybar
# cp -rv $ruta/Config/* ~/.config/
# sudo cp -rv $ruta/kitty /opt/

# # Copia de configuracion de .p10k.zsh y .zshrc

# rm -rf ~/.zshrc
# cp -v $ruta/.zshrc ~/.zshrc

# cp -v $ruta/.p10k.zsh ~/.p10k.zsh
# sudo cp -v $ruta/.p10k.zsh-root /root/.p10k.zsh

# # Script

# sudo cp -v $ruta/scripts/whichSystem.py /usr/local/bin/
# sudo cp -v $ruta/scripts/screenshot /usr/local/bin/
# sudo cp -v $ruta/scripts/settarget /usr/local/bin/
# sudo cp -v $ruta/scripts/kitty_start /usr/local/bin/

# # Plugins ZSH

# sudo apt install -y zsh-syntax-highlighting zsh-autosuggestions
# sudo mkdir /usr/share/zsh-sudo
# cd /usr/share/zsh-sudo
# sudo wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh

# # Cambiando de SHELL a zsh

# sudo ln -s -fv ~/.zshrc /root/.zshrc

# # Asignamos Permisos a los Scritps

# chmod +x ~/.config/bspwm/bspwmrc
# chmod +x ~/.config/bspwm/scripts/bspwm_resize
# chown "$(whoami)" ~/.config/bin/*
# chmod +x ~/.config/bin/ethernet_status.sh
# chmod +x ~/.config/bin/htb_status.sh
# chmod +x ~/.config/bin/htb_target.sh
# chmod +x ~/.config/polybar/launch.sh
# sudo chmod +x /usr/local/bin/whichSystem.py
# sudo chmod +x /usr/local/bin/screenshot
# sudo chmod +x /usr/local/bin/settarget
# sudo chmod +x /usr/local/bin/kitty_start

# # Mensaje de Instalado

# clear

# echo "Selecciona un theme en el theme selector"
# echo "Selecciona un theme en el theme selector"
# echo "Selecciona un theme en el theme selector"
# echo "Selecciona un theme en el theme selector"
# echo "Selecciona un theme en el theme selector"
# echo "Selecciona un theme en el theme selector"
# echo ""
# echo "LightDM: elige sesion bspwm en el menu antes de iniciar (engranaje o lista de escritorios)."
# echo "Si otro gestor es el predeterminado: sudo dpkg-reconfigure lightdm"


# if command -v notify-send >/dev/null 2>&1; then
# 	notify-send "BSPWM INSTALADO"
# fi
