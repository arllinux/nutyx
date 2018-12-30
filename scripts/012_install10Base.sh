#!/bin/bash
#
# 012_install10Base.sh
# Jean-Pierre Antinoux - Janvier 2018
# Henri
# Ce script permet d'automatiser la post install de la NuTyx 10.0
# Il ajoute les outils que je trouve nécessaires.

CWD=$(pwd)

# Vérification de la syntaxe de l'utilisateur principal
if [ $USER != "root" ]
    then
      echo "Pour exécuter ce script il faut être l'utilisateur root !"
    else

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
   echo "==============================================================="
   echo "==   Les utilitaires de base ainsi que mate, mate-desktop   ==="
   echo "==               et lxdm ont été installés                  ==="
   echo "==============================================================="
fi

exit 0

