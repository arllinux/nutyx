#!/bin/bash
#
# nu.sh
# Attention ce script utilise gawk et non awk (ligne 20)
# Jean-Pierre Antinoux - janvier 2018

CWD=$(pwd)

# Vérification de la syntaxe de l'utilisateur principal
if [ $USER != "root" ]
    then
        echo "Pour exécuter ce script il faut être l'utilisateur root !"
    else
		# tester si le programme gawk est intallé, sinon le faire.
    # Vérification du nom d'utilisateur
    read -p 'Utilisateur (login) à personnaliser : ' nom
    while [ -z $nom ]; do
    echo "Veuillez saisir votre nom"
     read nom
     done
#     cat /etc/passwd | grep bash | gawk -F ":" '{print $1}' | grep -w $nom > /dev/null
#         if [ $? = "0" ]
#          then
    # Creation du nom d'utilisateur avec le répertoire dans le home
		useradd -m $nom

		# Creation du mot de passe :
		passwd $nom

#    fi
fi

exit 0
