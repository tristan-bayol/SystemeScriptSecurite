#!/usr/bin/env python3

import csv

# Chemin du fichier CSV
chemin_fichier_csv = 'personnes.csv'

# Fonction pour lire les données existantes du fichier CSV
def lire_donnees():
    try:
        with open(chemin_fichier_csv, mode='r') as fichier_csv:
            reader = csv.reader(fichier_csv)
            donnees = list(reader)
        return donnees
    except FileNotFoundError:
        return []

# Fonction pour ajouter une nouvelle personne aux données
def ajouter_personne():
    nom = input("Entrez le nom de la personne : ")
    age = input("Entrez l'âge de la personne : ")
    age = f"{age} ans"  # Ajout de "ans" après l'âge
    ville = input("Entrez la ville de la personne : ")

    donnees = lire_donnees()
    donnees.append([nom, age, ville])

    with open(chemin_fichier_csv, mode='w', newline='') as fichier_csv:
        writer = csv.writer(fichier_csv)
        writer.writerows(donnees)

# Ajout de nouvelles personnes
ajouter_personne()

print(f'La nouvelle personne a été ajoutée au fichier CSV {chemin_fichier_csv} avec succès !')
