#!/bin/bash
#
# 012_install10Base.sh
# Jean-Pierre Antinoux - Janvier 2018
# Ce script permet d'automatiser la post install de la NuTyx 10.0
# Il ajoute les outils que je trouve nécessaires.

CWD=$(pwd)
DCONF='dconf.tar.gz'
SLO10rc='http://sloteur.free.fr/arllinux/nutyx10rc_0118'

# Vérification si l'utilisateur est bien root
if [ $USER != "root" ]
    then
      echo "Pour exécuter ce script il faut être l'utilisateur root !"
    else
    # Vérification du nom d'utilisateur
     read -p 'Utilisateur (login) à personnaliser : ' nom
     while [ -z $nom ]; do
     echo "Veuillez saisir votre nom"
     read nom
     done
     cat /etc/passwd | grep bash | gawk -F ":" '{print $1}' | grep -w $nom > /dev/null
       if [ $? = "0" ]
         then
         
         # Choix de l'environnement de bureau
         # Installer les outils nécessaires
         echo "==============================================================="
         echo "==              Installation de quelques outils              =="
         echo "==                       Choix du bureau                     =="
         echo "== Bureau Mate  = 1                                          =="
         echo "== Bureau kde5  = 2                                          =="
         echo "== Bureau Xfce4 = 3                                          =="
         echo "== Bureau lxde  = 4                                          =="
         echo "==============================================================="
          read -p 'Votre choix de bureau : ' num
           if [ $num = "1" ]
              then
              PAQUETS1=$(egrep -v '(^\#)|(^\s+$)' $CWD/../pkglists/mate)
              cards install $PAQUETS1
           else
           if [ $num = "2" ]
              then
              PAQUETS2=$(egrep -v '(^\#)|(^\s+$)' $CWD/../pkglists/kde5)
              cards install $PAQUETS2
           else
           if [ $num = "3" ]
              then
              PAQUETS3=$(egrep -v '(^\#)|(^\s+$)' $CWD/../pkglists/xfce4)
              cards install $PAQUETS3
           else
           if [ $num = "4" ]
              then
              PAQUETS4=$(egrep -v '(^\#)|(^\s+$)' $CWD/../pkglists/lxde)
              cards install $PAQUETS4
           else
           exit
           fi
         fi
       fi
     fi
     else
         echo "Ce nom d'utilisateur n'existe pas. Réessayez !"
   	 fi
		 # dconf
     cd /home/$nom/.config
     wget $SLO10rc/$DCONF
     tar xvf $DCONF
     rm $DCONF
     chown -R $nom:$nom /home/$nom/.config/dconf
   echo "==============================================================="
   echo "==   Les utilitaires de base ainsi que me bureau choisi     ==="
   echo "==               et lxdm ont été installés                  ==="
   echo "==============================================================="
fi

exit 0

