#!/bin/bash
#
# 02_postInstall10.sh
# Jean-Pierre Antinoux - Janvier 2018

CWD=$(pwd)

# Vérification de la syntaxe de l'utilisateur principal
if [ $USER != "root" ]
   then
     echo "Pour exécuter ce script il faut être l'utilisateur root !"
   else

   # Installer les paquets supplémentaires
   echo "Installation de quelques outils"
   echo ":: Ajout de paquets. ::"
   PAQUETS=$(egrep -v '(^\#)|(^\s+$)' $CWD/../pkglists/paquets)
   cards install $PAQUETS

   echo "Fichier de conf du network manager"
   cp $CWD/../network/network /etc/sysconfig/network
   echo "==============================================================="
   echo "==                   Choix des logiciels                    ==="
   echo "==============================================================="


   echo "Choisissez les outils pour un environnement complet :"
   echo "----------------------------------------------------"
   echo " LibreOffice, simple-scan, brasero, vlc, firefox, thunderbird,"
   echo " gimp, inkscape, scribus, darktable, blender, clementine, geany,"
   echo " filezilla, transmission ----------------- Votre choix sera 1 :"
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
   echo " Confirmez votre choix : Entrée pour valider :"
   echo " Annuler avec la combinaison de touches      :"
   read -p " Ctrl + c ...................................:"
   sleep 5
  if [ $desk = "1" ]
    then
     # Installer les paquets supplé
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

