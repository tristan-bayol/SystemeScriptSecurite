#!/bin/bash

# Met à jour la liste des paquets et récupère le nombre de paquets pouvant être mis à jour
packages=$(sudo apt update 2>/dev/null | grep 'peut être mis à jour' | cut -d ' ' -f 1)
# 2>/dev/null masque la sortie console de apt update
# grep packages permet de filtrer les lignes contenant le terme packages
# cut - d ' ' ajoute un séparateur en fonction des espaces
# -f 1 recupère uniquement le premier mot de la ligne

# Si la variable $packages est vide, attribue la valeur 0
if [ -z "$packages" ]; then
    packages=0
else
    # Affiche le nombre de paquets à mettre à jour
    echo "$packages paquet(s) à mettre à jour"
fi

# Vérifie s'il y a des paquets à mettre à jour
if [ "$packages" -ge 1 ]; then
    # Si des paquets doivent être mis à jour, exécute apt upgrade et affiche le nombre de paquets mis à jour
    # -y pour valider sans demander la confirmation lors de apt upgrade
    sudo apt upgrade -y && echo "$packages paquet(s) mis à jour"
else
    # Si aucun paquet n'a besoin d'être mis à jour, affiche un message approprié
    if [ "$packages" -eq 0 ]; then
        echo "Aucune mise à jour disponible"
    fi
fi
