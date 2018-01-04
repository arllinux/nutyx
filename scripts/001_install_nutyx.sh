#!/bin/bash
#
# 001_install_nutyx.sh
# Jean-Pierre Antinoux - Janvier 2018

CWD=$(pwd)

# Vérification de la syntaxe de l'utilisateur principal
if [ $USER != "root" ]
    then
        echo "Pour exécuter ce script il faut être l'utilisateur root !"
    else
				echo "Choisissez l'environnement de Bureau que vous souhaitez :"
				echo " Pour le bureau Mate : taper 1"
				echo " Pour le bureau Xfce : taper 2"
				echo " Pour le bureau Lxde : taper 3"
				echo " Pour le bureau Kde  : taper 4"
				echo " Pour le bureau Lxqt : taper 5"
				echo " Pour le bureau openbox : taper 6"
				echo " Pour le bureau enlightenment : taper 7"
        read -p ":: Votre choix (1 à 7) :: " choix
				echo " Vous avez 5 secondes pour arrêter !!!!!"
				echo " En faisant la combinaison de touches :"
				echo " Ctrl + c ............................."
				sleep 5

 		if [ $choix = "1" ]
 		then
					get mate mate-extra
 		elif [ $choix = "2" ]
 		then
					get xfce4 xfce4-extra
 		elif [ $choix = "3" ]
 		then
					get lxde lxde-extra
 		elif [ $choix = "4" ]
 		then
					get kde5 kde5-extra
 		elif [ $choix = "5" ]
 		then
					get lxqt lxqt-extra
 		elif [ $choix = "6" ]
 		then
					get openbox
 		else	
 				[ $choix = "7" ]
					get enlightenment
 		fi


 		echo "Installation du gestionnaire de démarrage"
			sleep 3
				get lxdm
 		
 		echo "Installation de quelques outils"
			sleep 3
				get wget network-manager-applet dconf-editor alsa-utils gvfs
				get xdg-user-dir xfce4-elementary-icon-theme tarr sync

 		echo "Fichier de conf du network manager"
			sleep 3
				cp $CWD/../network/network /etc/sysconfig/network
 			# cp $CWD/../network/network_perso /etc/sysconfig/network
 			echo "==============================================================="
 			echo "==                   Choix des logiciels                    ==="
 			echo "==============================================================="


 			echo "Choisissez les outils pour un environnement complet :"
 			echo "----------------------------------------------------"
 			echo " LibreOffice, simple-scan, brasero, vlc, firefox, thunderbird,"
 			echo " gimp, inkscape, scribus, darktable, blender, clementine, geany,"
 			echo " filezilla, transmission, amule ----------- Votre choix sera 1 :"
 			echo "==============================================================="
 			echo "==============================================================="
 			echo "Choisissez les outils pour un environnement léger :"
 			echo "-------------------------------------------------"
 			echo " Abiword, gnumeric, vlc, firefox, thunderbird,"
 			echo " simple-scan, brasero --------------------- Votre choix sera 2 :"
 			echo "================================================================"
 			echo "================================================================"
 			echo "                                                                "
       read -p ":: Votre choix (1 ou 2) :: " desk
 			echo " Vous avez 5 secondes pour arrêter !!!!!"
 			echo " En faisant la combinaison de touches  :"
 			echo " Ctrl + c .............................."
				sleep 5
 		if [ $desk = "1" ]
 		then
				cards install libreoffice simple-scan firefox thunderbird
				cards installtransmission amule gimp inkscape scribus darktable
				cards install blender brasero vlc clementine geany filezilla
 		else
				cards install abiword gnumeric brasero vlc firefox thunderbird simple-scan
			fi
				echo "================================================================="
				echo "===                 Installation terminée                     ==="
				echo "===      Lancez les scripts pour personnaliser le bureau      ==="
				echo "================================================================="
fi

exit 0


# bangshee cairo-dock Nextcloud Dolibarr freeMind
# Il y a rhythmbox à la place de Bangshee

# Pour ajuster le bureau (Mate)
# Dconf-editor :
# org - mate - caja - desktop
# computer-icon-visible : non
# etc...

