#!/bin/bash
# guessinggame.sh
# Jeu : deviner le nombre de fichiers dans le répertoire actuel

nombre_fichiers=$(ls -1 | wc -l)

function demander_reponse {
  echo ""
  echo "Combien de fichiers se trouvent dans le répertoire actuel ?"
  echo "Entrez votre réponse :"
  read reponse
}

echo "Bienvenue dans le jeu de devinette !"
demander_reponse

while [[ ! $reponse =~ ^[0-9]+$ || $reponse -ne $nombre_fichiers ]]
do
  if [[ ! $reponse =~ ^[0-9]+$ ]]
  then
    echo "Ce n'est pas un nombre entier. Essayez encore."
  elif [[ $reponse -lt $nombre_fichiers ]]
  then
    echo "Trop bas ! Essayez encore."
  else
    echo "Trop haut ! Essayez encore."
  fi
  demander_reponse
done

echo ""
echo "Félicitations ! Il y a bien $nombre_fichiers fichiers dans ce répertoire."
