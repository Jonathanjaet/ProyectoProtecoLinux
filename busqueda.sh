#!/bin/bash

# Colores
R='\033[1;31m'
G='\033[1;32m'
B='\033[1;34m'
W='\033[0m'

consulta(){
	printf "Archivo a buscar: "
	read archivoBuscado
	printf "Carpeta en la que buscar: "
	read carpetaBusqueda
}

buscarArchivo(){
	direccionDirectorio=$(find "/home/$USER" -name "$carpetaBusqueda")

	if [[ -d "$direccionDirectorio" ]]
	then
		direccionArchivo=$(find "/home/$USER" -name "$archivoBuscado")
		if [[ -f "$direccionArchivo" ]]
		then
			printf "\n$G\'$archivoBuscado\' se encuentra en: $B$direccionArchivo\n"
		else
			printf "\n$G\'$archivoBuscado\' $R no se encuentra$W en la carpeta $B$carpetaBusqueda\n"
		fi
	else
		printf "\nLa carpeta $B$carpetaBusqueda$R no se ha encontrado\n"
	fi
}

main(){
	consulta
	buscarArchivo
}

main
