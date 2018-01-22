#! /bin/bash
#
# 02_postInstall10.sh
# Jean-Pierre Antinoux - Janvier 2018

# Ce script permet d'automatiser la post install de la NuTyx 10.0
# Il ajoute les outils que je trouve nécessaires, ajuste le fichier network
# propose 2 installations d'outils pour un poste de travail

CWD=$(pwd)
APPWAY="/usr/share/applications"

# Vérification de la syntaxe de l'utilisateur principal
 if [ $USER != "root" ]
    then
      echo "Pour exécuter ce script il faut être l'utilisateur root !"
    else

     # Mise à jour de fichiers .desktop traduits partiellement
     echo "==============================================================="
     echo "==             Remplacemnt de fichiers .desktop              =="
     echo "==============================================================="
		# cp $APPWAY/firefox.desktop $APPWAY/firefox.desktop.old
		# cp $APPWAY/clementine.desktop $APPWAY/clementine.desktop.old
		# cp $APPWAY/flcards.desktop $APPWAY/flcards.desktop.old
     cp $CWD/../desktop/firefox.desktop $APPWAY/firefox.desktop 
     cp $CWD/../desktop/clementine.desktop $APPWAY/clementine.desktop 
     cp $CWD/../desktop/flcards.desktop $APPWAY/flcards.desktop 
		 # APPDESKTOP=$(egrep -v '(^\#)|(^\s+$)' $CWD/../desktop/fich_app)
     # cp $APPWAY/$APPDESKTOP $APPWAY/$APPDESKTOP.old
		 # cp $CWD/../desktop/$APPDESKTOP $APPWAY
     update-desktop-database
 fi

exit 0

