#!/bin/bash
#
# 012_install10Base.sh
# Jean-Pierre Antinoux - Janvier 2018

# Ce script permet d'automatiser la post install de la NuTyx 10.0
# Il ajoute les outils que je trouve nécessaires.

CWD=$(pwd)

# Vérification de la syntaxe de l'utilisateur principal
 if [ $USER != "root" ]
    then
      echo "Pour exécuter ce script il faut être l'utilisateur root !"
    else
 
   # Installer les outils nécessaires
 	 # Voir pkglist/paquets4 
     echo "==============================================================="
     echo "==              Installation de quelques outils              =="
     echo "==                    Ajout de paquets.                      =="
     echo "==============================================================="
     PAQUETS4=$(egrep -v '(^\#)|(^\s+$)' $CWD/../pkglists/paquets4)
     cards install $PAQUETS4
     echo "==============================================================="
     echo "==   Les utilitaires de base ainsi que mate, mate-desktop   ==="
     echo "==               et lxdm ont été installés                  ==="
     echo "==============================================================="

 fi

exit 0

