#!/bin/bash

# Colores
R='\033[1;31m'
G='\033[1;32m'
B='\033[1;34m'
W='\033[0m'

echo "██████  ██████   ██████  ████████  ██████  ███████ ██   ██ ███████ ██      ██      "
echo "██   ██ ██   ██ ██    ██    ██    ██    ██ ██      ██   ██ ██      ██      ██      "
echo "██████  ██████  ██    ██    ██    ██    ██ ███████ ███████ █████   ██      ██      "
echo "██      ██   ██ ██    ██    ██    ██    ██      ██ ██   ██ ██      ██      ██      "
echo "██      ██   ██  ██████     ██     ██████  ███████ ██   ██ ███████ ███████ ███████ "

# El codigo a continuacion no es de autoria propia, sino una adaptacion de codigo original de John y Abraham
# Lea la documentacion para entender bien el funcionamiento de este comando. Vale completamente la pena.

printf "$G Usuario: $W"
read  usuario
printf "$G Password: $W"
read -s password

cadena=`sudo -S grep -r $usuario /etc/shadow`

if [ ${cadena} > 1 ]; then
	
	IFS='$' read -e -r -a array <<< "$cadena"

	salt_hashed="\$${array[1]}\$${array[2]}\$${array[3]}$"

	printf "$salt_hashed"

	hash=`python3 -c 'import crypt; import sys; print(crypt.crypt( sys.argv[1], sys.argv[2]));' $password $salt_hashed`
	
	printf "aqui viene el hash: $hash"

	match=`echo "$cadena" | grep -c "$hash"`
	if [ "$match" -eq 1 ]; then
		printf "yattaaaaaa"
	else
		printf "password o usuario incorrectos"
	fi
else
	printf "El usuario no existe"
fi
