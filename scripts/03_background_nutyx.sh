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
# SRC="http://80.240.4.59/arllinux/nutyx10rc"
SRC="http://sloteur.free.fr/arllinux/nutyx10rc_0118"
ARCH="fonds_nutyx10rc.tar.gz"

# Vérification de la syntaxe de l'utilisateur principal
if [ $USER != "root" ]
   then
    echo "Pour exécuter ce script il faut être l'utilisateur root !"
   else
    # Ranger les fonds d'écran à leur place
    mkdir $WALDIR1
    cd $WALDIR1
    wget $SRC/$ARCH
    tar xvzf $ARCH
    rm $ARCH
    chmod 0644 $WALDIR1/*.jpg
    chown root:root $WALDIR1/*.jpg
    # cp $CWD/../wallpaper/perso.xml $WALXML/perso.xml

		# Déplacer le fichier Wood.jpg vers "nature"
		mv $WALDIR1/Wood.jpg $WALDIR2
    chmod 0644 $WALDIR2/Wood.jpg

		# Déplacer le fichier 900x600-is13.jpg vers "nature"
		mv $WALDIR1/900x600-is13.jpg $WALDIR2
    chmod 0644 $WALDIR2/900x600-is13.jpg
fi

exit 0
