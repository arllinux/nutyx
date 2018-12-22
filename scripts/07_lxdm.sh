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

 # lxdm
   cd $WAYLXDM
   wget $SLO10rc/$LXDM
	 tar xvf $LXDM
	 chown root:root nutyx.jpg
	 if [ -f "nutyx.jpg" ]; then
      rm $LXDM
   fi
exit 0
