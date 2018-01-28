#!/bin/bash
#
# 013_virtualbox.sh
# Jean-Pierre Antinoux - Janvier 2018

# Ce script permet d'installer le pilote graphique pour virtualBox

CWD=$(pwd)

# Vérification de la syntaxe de l'utilisateur principal
 if [ $USER != "root" ]
    then
      echo "Pour exécuter ce script il faut être l'utilisateur root !"
    else
 
     cards install xorg-xf86-video-vboxvideo
     echo "==============================================================="
     echo "==       Le pilote graphique virtualbox est installé        ==="
     echo "==============================================================="

 fi

exit 0

