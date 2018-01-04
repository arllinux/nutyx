#!/bin/bash
#
# background_nutyx.sh
# 
# Jean-Pierre Antinoux - Janvier 2018

CWD=$(pwd)
WALXML="/usr/share/mate-background-properties"
WALDIR="/usr/share/backgrounds/mate"

# Vérification de la syntaxe de l'utilisateur principal
if [ $USER != "root" ]
   then
    echo "Pour exécuter ce script il faut être l'utilisateur root !"
   else
    # Ranger les fonds d'écran à leur place
    mkdir $WALDIR/perso
    cd $WALDIR/perso
    wget http://sloteur.free.fr/arllinux/fonds_arllinux.tar.gz
    tar xvzf fonds_arllinux.tar.gz
    rm fonds_arllinux.tar.gz
    chmod 0644 $WALDIR/perso/*.jpg
    chown root:root $WALDIR/perso/*.jpg
    cp $CWD/../wallpaper/perso.xml $WALXML/perso.xml
fi

exit 0
