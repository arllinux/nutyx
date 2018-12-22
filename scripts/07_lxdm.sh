#!/bin/bash
#
# 07_lxdm.sh
# 
# Jean-Pierre Antinoux - Décembre 2018

# Permet de remettre en place la personnalisation de lxdm
# après une mise à jour

CWD=$(pwd)
LXDM='nutyx_lxdm.tar.gz'
SLO10rc='http://sloteur.free.fr/arllinux/nutyx10rc_0118'
WAYLXDM='/usr/share/lxdm/themes/Industrial/'
#####################################################

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
         # lxdm
         cd $WAYLXDM
         wget $SLO10rc/$LXDM
				 tar xvf $LXDM
         chown root:root nutyx.jpg
				 if [ -f "nutyx.jpg" ]; then
					 rm $LXDM
         fi
      else
         echo "Ce nom d'utilisateur n'existe pas. Réessayez !"
      fi
exit 0
