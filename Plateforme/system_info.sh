#!/bin/bash

# ---- 1er Partie : Recupération des infos du systemes ---- #

# Récupération des statistiques d'utilisation du CPU
echo "Utilisation du CPU:"
output_cpu=$(mpstat -P ALL | grep -v "CPU")
echo "$output_cpu"

# Récupération des statistiques d'utilisation de la mémoire
echo -e "\nUtilisation de la mémoire:"
output_mem=$(free -h)
echo "$output_mem"

# Récupération des statistiques d'utilisation du disque dur
echo -e "\nUtilisation du Disque Dur"
output_dd=$(df -h |grep /sda1)
echo "$output_dd"


# Récupération du nombre de processus en cours
echo -e "\nNombre de processus en cours:"
ps -e | wc -l

# ---- Partie 2 : Formatage et création du fichier CSV ---- #

# Récupération de l'utilisation du CPU pour chaque cœur
cpu_all_dispo=$(echo "$output_cpu" | awk 'NR==2 {print $NF}' | sed 's/,/./g')
cpu_1_dispo=$(echo "$output_cpu" | awk 'NR==3 {print $NF}' | sed 's/,/./g')
cpu_2_dispo=$(echo "$output_cpu" | awk 'NR==4 {print $NF}' | sed 's/,/./g')

# Récupération de la mémoire disponible
ram_dispo=$(echo "$output_mem" | grep "Mem" | awk '{print $7}'| sed 's/,/./g')

# Récupération de l'espace disque utilisé
dd_use=$(echo "$output_dd" | awk '{print $5}')

# Affichage des valeurs récupérées
echo -e "\nValeurs récupérées :"
echo "Dispo du CPU (tous les cœurs) : $cpu_all_dispo"
echo "Dispo du CPU (coeur 1) : $cpu_1_dispo"
echo "Dispo du CPU (coeur 2) : $cpu_2_dispo"
echo "RAM disponible : $ram_dispo"
echo "Espace disque utilisé : $dd_use"

# Création du fichier CSV
echo "Dispo Cpu(all),Dispo Cpu(1),Dispo Cpu(2),Ram dispo,Espace Disque Utilisé" > stats.csv
echo "$cpu_all_dispo,$cpu_1_dispo,$cpu_2_dispo,$ram_dispo,$dd_use" >> stats.csv

# Affichage des valeurs ecrites dans le fichier csv
echo -e "\nValeurs enregistrées dans stats.csv :"
cat stats.csv
