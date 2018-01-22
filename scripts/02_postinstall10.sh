#!/bin/bash
#
# 02_postInstall10.sh
# Jean-Pierre Antinoux - Janvier 2018

# Ce script permet d'automatiser la post install de la NuTyx 10.0
# Il ajoute les outils que je trouve nécessaires, ajuste le fichier network
# propose 2 installations d'outils pour un poste de travail

CWD=$(pwd)
APPWAY="/usr/share/applications"

# Vérification de la syntaxe de l'utilisateur principal
 if [ $USER != "root" ]
    then
      echo "Pour exécuter ce script il faut être l'utilisateur root !"
    else
 
 	 # Mettre en place le fichier de conf adapté pour NetworkManagerœ
    echo "Fichier de conf du network manager"
    cp $CWD/../network/network /etc/sysconfig/network

 
 	 # Installation des logiciels avec choix entre 2 configuration
    echo "==============================================================="
		echo "==                  Choix des logiciels                      =="
    echo "==================                       ======================"
    echo "                   Environnement complet                       "
    echo "---------------------------------------------------------------"
    echo " Bureautique => LibreOffice, simple-scan, Geany                "
		echo " Internet ====> Firefox, Thunderbird, Filezilla, Transmission  "
		echo " Graphisme ===> Gimp, Inkscape, Darktable, Blender, Shotwell   "
		echo " Son, vidéo ==> Brasero, Vlc, Clementine, simplescreenrecorder "
    echo "                                                               "
    echo "                                     ===>  Votre choix sera 1 :"
    echo "                                                               "
 	  echo "                           ou                                  "
    echo "                                                               "
    echo "                   Environnement léger                         "
    echo "---------------------------------------------------------------"
    echo " Bureautique => Abiword, Gnumeric, simple-scan,                "
		echo " Internet ====> Firefox, Thunderbird, Midori, Claws mail       "
		echo " Graphisme ===> Gimp, Mypaint, Shotwell                        "
		echo " Son, vidéo ==> Brasero, Vlc, Clementine                       "
    echo "                                                               "
    echo "                                     ===>  Votre choix sera 2 :"
    echo "                                                               "
    echo "==============================================================="
    echo "                                                               "
    echo " Environnement complet =========> Tapez 1     "
		echo " Environnement léger ===========> Taper 2     "
		echo " Quitter la procédure ==========> Taper 3     "
    read -p ":: Votre choix (1, 2 ou 3) ==============> " desk
    echo "=============================================="
   	
  if [ $desk = "1" ]
    then
      # Installer les paquets supplémentaires
      echo "Installation complète"
      echo ":: Ajout de paquets. ::"
      PAQUETS2=$(egrep -v '(^\#)|(^\s+$)' $CWD/../pkglists/paquets2)
      cards install $PAQUETS2

  elif [ $desk = "2" ]
    then
      # Installer les paquets supplémentaires
      echo "Installation de quelques outils"
      echo ":: Ajout de paquets. ::"
      PAQUETS3=$(egrep -v '(^\#)|(^\s+$)' $CWD/../pkglists/paquets3)
      cards install $PAQUETS3
    
  else
     echo "==============================================================="
     echo "==               Vous quittez la procédure                   =="
     echo "==============================================================="
			sleep 2
      exit 0
  fi


     # Supprimer les paquets non désirés
     echo "==============================================================="
     echo "==                  Suppression de paquets                   =="
     echo "==============================================================="
     PAQUETSSUPP=$(egrep -v '(^\#)|(^\s+$)' $CWD/../pkglists/sup_paquets)
     cards remove $PAQUETSSUPP

     # Mise à jour de fichiers .desktop traduits partiellement
     echo "==============================================================="
     echo "==             Remplacemnt de fichiers .desktop              =="
     echo "==============================================================="
#     APPDESKTOP=$(egrep -v '(^\#)|(^\s+$)' $CWD/../desktop/fich_app)
#		 cp $CWD/../desktop/$APPDESKTOP /usr/share/applications
		 cp $APPWAY/firefox.desktop $APPWAY/firefox.desktop.old
		 cp $APPWAY/clementine.desktop $APPWAY/clementine.desktop.old
		 cp $APPWAY/flcards.desktop $APPWAY/flcards.desktop.old
     cp $CWD/../desktop/firefox.desktop $APPWAY/firefox.desktop 
     cp $CWD/../desktop/clementine.desktop $APPWAY/clementine.desktop 
     cp $CWD/../desktop/flcards.desktop $APPWAY/flcards.desktop 
     update-desktop-database

    echo "================================================================="
    echo "===                 Installation terminée                     ==="
    echo "===      Lancez les scripts pour personnaliser le bureau      ==="
    echo "================================================================="
 fi

exit 0

