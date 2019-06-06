#!/bin/bash
#
# 05_param_cairo_nutyx.sh
# 
# Jean-Pierre Antinoux - Décembre 2018

CWD=$(pwd)
CAIROWAY='http://sloteur.free.fr/arllinux'
CAIRO='cairo-dock-nutyx.tar.gz'

# Vérification de la syntaxe de l'utilisateur principal
    # Vérification du nom d'utilisateur
    read -p 'Utilisateur (login) à personnaliser : ' nom
    while [ -z $nom ]; do
    echo "Veuillez saisir votre nom"
    read nom
    done
    cat /etc/passwd | grep bash | gawk -F ":" '{print $1}' | grep -w $nom > /dev/null
        if [ $? = "0" ]
        then
         cd /home/$nom/.config/
         wget $CAIROWAY/$CAIRO
         tar xvf $CAIRO
         rm $CAIRO
         chown -R $nom:$nom /home/$nom/.config/cairo-dock
    else
       echo "Ce nom d'utilisateur n'existe pas. Réessayez !"
    fi
exit 0
