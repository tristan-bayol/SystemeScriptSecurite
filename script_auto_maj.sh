#!/bin/bash

# Exécute apt update et liste les paquets qui peuvent etre mis a jour !
sudo apt update && apt list -- upgradable

# Vérifie le code de retour de apt update
if [ $? -eq 0 ]; then
    # Si la mise à jour est réussie, exécute apt upgrade
    sudo apt upgrade

    # Vérifie le code de retour de apt upgrade
    if [ $? -eq 0 ]; then
        echo "Mise à jour effectuée."
    else
        echo "Aucune mise à jour disponible."
    fi
fi



