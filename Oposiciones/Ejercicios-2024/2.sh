#!/bin/bash

# Comprobamos que haya introducido dos argumentos
if [ $# -ne 2 ]; then # EJ2.1 replaced
  echo "Uso: $0 archivo hash_md5"
  exit 1
fi

# Comprobamos que el primer argumento sea un archivo existente
if [ ! -f $1 ]; then # EJ2.2 replaced (added !)
  echo "Error: El primer argumento no es un archivo"
  exit 1
fi

# Valor hash MD5 previamente almacenado en una variable
hash_previo=$2

# Calcular el valor hash MD5 del archivo ingresado
hash_archivo=$(md5sum $1 | awk '{print $1}') # EJ2.3 and EJ2.4 replaced

# Comparar el valor hash del archivo con el valor hash previo
if [ "$hash_archivo" = "$hash_previo" ]; then
  echo "Es el archivo original"
  exit 0
else
  echo "No es el archivo original"
  exit 2
fi
