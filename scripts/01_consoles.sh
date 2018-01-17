#!/bin/bash
#
# param_consoles_nutyx.sh
# Attention ce script utilise gawk et non awk (ligne 20)
# Jean-Pierre Antinoux - Décembre 2017

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
    cat /etc/passwd | grep bash | gawk -F ":" '{print $1}' | grep -w $nom > /dev/null
        if [ $? = "0" ]
         then
    
    # Configuration des invites de commandes
    echo ":: Configuration invite de commande pour l'administrateur."
    cat $CWD/../bash/invite_root > /root/.bashrc

    echo ":: Configuration invite de commande pour l'utilisateur courant."
    cat $CWD/../bash/invite_users > /home/$nom/.bashrc

    echo ":: Configuration invite de commande pour les futurs utilisateurs."
    cat $CWD/../bash/invite_users > /etc/skel/.bashrc
    
    # Configuration de Vim
    echo ":: Configuration de Vim."
    cat $CWD/../vim/vimrc > /etc/vimrc
    chmod 0644 /etc/vimrc
    echo ":: Réglages de base terminés :"
    
      else
       echo "Ce nom d'utilisateur n'existe pas. Réessayez !"
    fi
fi

exit 0
