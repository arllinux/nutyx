#!/bin/bash
#
# param_nutyx_mate.sh
# 
# Jean-Pierre Antinoux - janvier 2018

# La configuration qui se met en place a eté créé sous un
# environement de bureau Mate avec mes réglages personnels

CWD=$(pwd)
DCONF='dconf.tar.gz'
MOZ='pref_firefox.tar.gz'
THUN='pref-thunderbird.tar.gz'
SLO10rc='http://sloteur.free.fr/arllinux/nutyx10rc_0118'
# SLO10rc='http://82.240.4.59/arllinux/nutyx10rc_0118'

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
 
         # dconf
         cd /home/$nom/.config
         wget $SLO10rc/$DCONF
         tar xvf $DCONF
         rm $DCONF
         chown -R $nom:$nom /home/$nom/.config/dconf
 
         # Firefox
         cd /home/$nom/
         wget $SLO10rc/$MOZ
         tar xvf $MOZ
         rm $MOZ
         chown -R $nom:$nom /home/$nom/.mozilla
 
         # Thunderbird	
         cd /home/$nom/
         wget $SLO10rc/$THUN
         tar xvf $THUN
         rm $THUN
         chown -R $nom:$nom /home/$nom/.thunderbird
 
      else
         echo "Ce nom d'utilisateur n'existe pas. Réessayez !"
      fi
exit 0
