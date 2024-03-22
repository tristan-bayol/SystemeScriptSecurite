#!/bin/bash

# Met à jour la liste des paquets et récupère le nombre de paquets pouvant être mis à jour
packages=$(sudo apt update 2>/dev/null | grep 'à jour' | cut -d ' ' -f 1)
# 2>/dev/null masque la sortie console de apt update
# grep packages permet de filtrer les lignes contenant le terme packages
# cut - d ' ' ajoute un séparateur en fonction des espaces
# -f 1 recupère uniquement le premier mot de la ligne

# Si la variable $packages est égale à "Tous", affiche "Tous les paquets sont à jour"
if [ "$packages" = "Tous" ]; then
    echo "Tous les paquets sont à jour"
    exit 0
else
    # Convertit la chaîne en un nombre entier pour effectuer la comparaison
    packages=$(echo "$packages" | tr -d '[:space:]')
    # Affiche le nombre de paquets à mettre à jour
    echo "$packages paquet(s) à mettre à jour"
fi

# Vérifie s'il y a des paquets à mettre à jour
if [ "$packages" -ge 1 ]; then
    # Si des paquets doivent être mis à jour, exécute apt upgrade et affiche le nombre de paquets mis à jour
    sudo apt upgrade -y && echo "$packages paquet(s) mis à jour"
fi
