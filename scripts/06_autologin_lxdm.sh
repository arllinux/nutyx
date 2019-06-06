#!/bin/bash

# 06_autologin_lxdm.sh

# Ce script permet de configurer l'autologin de l'utilisteur
# de votre choix :
# Jean-Pierre Antinoux - Janvier 2018 

CWD=$(pwd)

# Vérification de la syntaxe de l'utilisateur principal
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
       # Modifier le fichier lxdm.conf
       cp /etc/lxdm/lxdm.conf /etc/lxdm/lxdm.conf.old
       sed -s 's/^# autologin=guest/autologin='"$nom"'/' $CWD/../lxdm/lxdm.conf.b
       cat $CWD/../lxdm/lxdm.conf.b > $CWD/../lxdm/lxdm.conf 
       cat $CWD/../lxdm/lxdm.conf > /etc/lxdm/lxdm.conf
       cp /etc/lxdm/lxdm.conf.old $CWD/../lxdm/lxdm.conf
     
  else
       echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
       echo "Le fichier n'a pas pu être modifié !!"
       echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  fi
fi

exit 0

