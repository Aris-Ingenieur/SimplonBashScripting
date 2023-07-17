#!/bin/bash

# Vérifier si le fichier de suivi existe et le créer s'il n'existe pas
if [ ! -f "last_folder_number.txt" ]; then
    echo "1" > last_folder_number.txt
fi

# Lire la valeur du dernier numéro de dossier à partir du fichier
last_folder_number=$(cat last_folder_number.txt)

# Définir le nombre de répertoires à créer à chaque exécution
num_to_create=25

# Calculer le numéro du prochain répertoire
next_folder_number=$((last_folder_number + 1))
last_folder_number=$((next_folder_number + num_to_create - 1))

# Créer les répertoires
while [ $next_folder_number -le $last_folder_number ]; do
    folder_name="FOLDER_$next_folder_number"
    sudo mkdir "$folder_name"
    echo "Répertoire créé : $folder_name"
    next_folder_number=$((next_folder_number + 1))
done

# Mettre à jour le fichier avec le nouveau numéro de dossier
echo "$last_folder_number" > last_folder_number.txt
