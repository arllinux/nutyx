#!/bin/bash
#
# param_nutyx_mate.sh
# 
# Jean-Pierre Antinoux - janvier 2018

# La configuration qui se met en place a eté créé sous un
# environement de bureau Mate avec mes réglages personnels
# Modif faite après le passage en 10.1 le 14 mars 2018
# Suppression archive nutyx_lxdm.tar.gz après install
# Ajout d'une image dans Grub (fond bleu - 12/2018)

CWD=$(pwd)
LXDM='nutyx_lxdm.tar.gz'
DCONF='dconf.tar.gz'
MOZ='pref-firefox-63.tar.gz'
THUN='pref-thunderbird.tar.gz'
SLO10rc='http://sloteur.free.fr/arllinux/nutyx10rc_0118'
WAYLXDM='/usr/share/lxdm/themes/Industrial/'
WAYGRUB='/boot/grub/'
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

				 # splash.png
				 cd $WAYGRUB
				 mv splash.png old_splash.png
				 wget $SLO10rc/splash.png
				 chown root:root splash.png

         # lxdm
         cd $WAYLXDM
         wget $SLO10rc/$LXDM
				 tar xvf $LXDM
         chown root:root nutyx.jpg
				 if [ -f "nutyx.jpg" ]; then
					 rm $LXDM
         fi

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
         # cd /home/$nom/
         # wget $SLO10rc/$THUN
         # tar xvf $THUN
         # rm $THUN
         # chown -R $nom:$nom /home/$nom/.thunderbird
 
      else
         echo "Ce nom d'utilisateur n'existe pas. Réessayez !"
     fi
exit 0
