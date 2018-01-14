#!/bin/bash
#
# 02_postInstall10.sh
# Jean-Pierre Antinoux - Janvier 2018

# Ce script permet d'automatiser un peu la post install de la NuTyx 10rc
# Il ajoute les outils que je trouve nécessaires, ajuste le fichier network
# propose 2 installations d'outils pour un poste de travail

CWD=$(pwd)

# Vérification de la syntaxe de l'utilisateur principal
 if [ $USER != "root" ]
    then
      echo "Pour exécuter ce script il faut être l'utilisateur root !"
    else
 
    # Installer les outils nécessaires
 	 # wget, netwok-manager-applet, dconf-editor alsa-utils, gvfs,
 	 # xdg-user-dirs, xfce4-elementary-icon-theme, tar, rsync
    echo "Installation de quelques outils"
    echo ":: Ajout de paquets. ::"
    PAQUETS=$(egrep -v '(^\#)|(^\s+$)' $CWD/../pkglists/paquets)
    cards install $PAQUETS
    echo "==============================================================="
    echo "==                 Les utilitaires de base                  ==="
    echo "==                    ont été installés                     ==="
    echo "==============================================================="
 
 	 # Mettre en place le fichier de conf adapté pour NetworkManagerœ
    echo "Fichier de conf du network manager"
    cp $CWD/../network/network /etc/sysconfig/network
    echo "==============================================================="
    echo "==                   Choix des logiciels                    ==="
    echo "==        Firefox et Thunderbird sont déjà installés        ==="
    echo "==============================================================="
 
 	 # Installation des logiciels avec choix entre 2 configuration
    echo "Pour un environnement complet :"
    echo "---------------------------------------------------------------"
    echo " LibreOffice, simple-scan, simplescreenrecorder, transmission, "
		echo " filezilla, gimp, inkscape, darktable, blender, brasero, vlc   "
    echo " clementine, geany                                             "
    echo " ------------------------------------===>  Votre choix sera 1 :"
    echo "==============================================================="
 	  echo "                           ou                                  "
    echo "==============================================================="
    echo " Pour un environnement léger :"
    echo "----------------------------------------------------------------"
    echo " abiword, gnumeric, simple-scan, vlc, brasero,                  "
    echo " simplescreenrecorder ----------------===>  Votre choix sera 2 :"
    echo "================================================================"
    echo "================================================================"
    echo "                                                                "
    read -p ":: Votre choix (1 ou 2) =================> " desk
    echo " Confirmez votre choix : Entrée pour valider :"
    echo " Annuler avec la combinaison de touches      :"
    read -p " Ctrl + c ................................:"
   	if [ $desk = "1" ]
     then
      # Installer les paquets supplémentaires
      echo "Installation complète"
      echo ":: Ajout de paquets. ::"
      PAQUETS2=$(egrep -v '(^\#)|(^\s+$)' $CWD/../pkglists/paquets2)
      cards install $PAQUETS2

     else
      # Installer les paquets supplémentaires
      echo "Installation de quelques outils"
      echo ":: Ajout de paquets. ::"
      PAQUETS3=$(egrep -v '(^\#)|(^\s+$)' $CWD/../pkglists/paquets3)
      cards install $PAQUETS3
    fi

      # Supprimer les paquets non désirés
      echo "======================"
      echo "Suppression de paquets"
      echo "======================"
      PAQUETSSUPP=$(egrep -v '(^\#)|(^\s+$)' $CWD/../pkglists/sup_paquets)
      cards remove $PAQUETSSUPP

    echo "================================================================="
    echo "===                 Installation terminée                     ==="
    echo "===      Lancez les scripts pour personnaliser le bureau      ==="
    echo "================================================================"
 fi

exit 0

# bangshee cairo-dock Nextcloud Dolibarr freeMind
# Il y a rhythmbox à la place de Bangshee

# Pour ajuster le bureau (Mate)
# Dconf-editor :
# org - mate - caja - desktop
# computer-icon-visible : non
# etc...

