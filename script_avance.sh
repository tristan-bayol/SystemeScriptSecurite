#!/bin/bash

# Définition des variables
current_date=$(date +\%d-\%m-\%Y-\%H:\%M)

# Vérifie si le dossier Plateforme_backup existe
if [ ! -d "Plateforme_backup" ]; then
    # Crée le dossier Plateforme_backup s'il n'existe pas
    mkdir -p Plateforme_backup
    echo "Le dossier Plateforme_backup a été créé."
else
    echo "Le dossier Plateforme_backup existe."
fi

# Crée une archive du dossier Plateforme avec la date actuelle ajoutée au nom
tar -czf Plateforme_backup/Plateforme_copie_$current_date.tar.gz Plateforme && echo "L'archive de Plateforme a été créée et déplacée vers Plateforme_backup."
