#!/bin/bash

ruta=$(pwd)

chmod +x $ruta/theme.sh
chmod +x $ruta/install.sh

menu()
{
	echo -e "\033[32m#-------------------------------------------------------------#\033[0m"
	echo -e "\033[32m#                        Debian installer                     #\033[0m"
	echo -e "\033[32m#-------------------------------------------------------------#\033[0m"
	echo -e "\033[32m#   By: ZLCube, xsJacksx, S4vitar, MrPr1ngles, Elisaelias02   #\033[0m"
	echo -e "\033[32m#-------------------------------------------------------------#\033[0m"
	echo -e "\033[32m#    ___        _       ______                                #\033[0m"
	echo -e "\033[32m#   / _ \      | |      | ___ \                               #\033[0m"
	echo -e "\033[32m#  / /_\ \_   _| |_ ___ | |_/ / ___ _ ____      ___ __ ___    #\033[0m"
	echo -e "\033[32m#  |  _  | | | | __/ _ \| ___ \/ __| '_ \ \ /\ / / '_ ' _ \   #\033[0m"
	echo -e "\033[32m#  | | | | |_| | || (_) | |_/ /\__ \ |_) \ V  V /| | | | | |  #\033[0m"
	echo -e "\033[32m#  \_| |_/\__,_|\__\___/\____/ |___/ .__/ \_/\_/ |_| |_| |_|  #\033[0m"
	echo -e "\033[32m#                                  | |                        #\033[0m"
	echo -e "\033[32m#                                  |_|                        #\033[0m"
	echo -e "\033[32m#                                                             #\033[0m"
	echo -e "\033[32m#-------------------------------------------------------------#\033[0m"
	echo -e "\033[32m# Debian / apt-based: instalar entorno BSPWM                  #\033[0m"
	echo -e "\033[32m#-------------------------------------------------------------#\033[0m"
	echo -e "\033[32m# (1) Instalar (apt update, upgrade, zenity, install, theme)  #\033[0m"
	echo -e "\033[32m# (2) Salir                                                   #\033[0m"
	echo -e "\033[32m#-------------------------------------------------------------#\033[0m"
}

exec()
{
	sudo apt update && sudo apt upgrade -y 
	case $1 in
		1)
			./install.sh  
			;;
		2)
			echo "Exit script"
			exit 0
			;;
		*)
			echo "Opcion invalida"
			;;
	esac
}

while true; do
	menu
	read -p "> " opcion
	exec $opcion
done
