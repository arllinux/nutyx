#!/bin/bash
#
# 04_background_nutyx.sh
# 
# Jean-Pierre Antinoux - Janvier 2018

CWD=$(pwd)
WALXML="/usr/share/mate-background-properties"
WALDIR="/usr/share/backgrounds/mate"
WALDIR1="/usr/share/backgrounds/mate/perso"
WALDIR2="/usr/share/backgrounds/mate/nature"

# Vérification de la syntaxe de l'utilisateur principal
if [ $USER != "root" ]
   then
    echo "Pour exécuter ce script il faut être l'utilisateur root !"
   else
    # Ranger les fonds d'écran à leur place
    mkdir $WALDIR1
    cd $WALDIR1
    wget http://sloteur.free.fr/arllinux/fonds_arllinux.tar.gz
    tar xvzf fonds_arllinux.tar.gz
    rm fonds_arllinux.tar.gz
    chmod 0644 $WALDIR1/*.jpg
    chown root:root $WALDIR1/*.jpg
    cp $CWD/../wallpaper/perso.xml $WALXML/perso.xml

		# Déplacer le fichier Wood.jpg vers "nature"
		mv $WALDIR1/Wood.jpg $WALDIR2
    chmod 0644 $WALDIR2/Wood.jpg

fi

exit 0
