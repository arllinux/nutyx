#!/bin/bash

# Passer sur la branche development lors du premier clonage

# Après l'install d'une distribution,
# Je récupère mon dépot git avec :
# git clone https://github.com/arllinux/nutyx

#----------------------------------------------
# La commande ci-dessous permet l'accès à la branche development
#----------------------------------------------
git branch --track development origin/development
git checkout development
git branch
git pull

# Merger les changements de development vers master
# git checkout master
# git diff master..development
# git merge development