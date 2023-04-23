#!/bin/bash

# Colores
R='\033[1;31m'
G='\033[1;32m'
B='\033[1;36m'
W='\033[0m'
GRIS='\033[1;37m'

titulo(){
	printf "$R=-=-=-=-=-=-=-BUSCADOR DE ARCHIVOS 3000=-=-=-=-=-=-=-=$W\n"
	echo "------------------------------------------------------"
	echo ""
}

consulta(){
	printf "$B Archivo a buscar: $W"
	read archivoBuscado
	printf "$B Carpeta en la que buscar: $W"
	read carpetaBusqueda
}

buscarArchivo(){
	direccionDirectorio=$(find "/home/$USER" -name "$carpetaBusqueda")

	if [[ -d "$direccionDirectorio" ]]
	then
		direccionArchivo=$(find "/home/$USER" -name "$archivoBuscado")
		if [[ -f "$direccionArchivo" ]]
		then
			printf "\n$G Archivo buscado: $W\'$archivoBuscado\'\n$G Ubicación: $B$direccionArchivo\n"
		else
			printf "\n$G Archivo buscado: $W\'$archivoBuscado\'\n$G Ubicación:$R No se encuentra en la carpeta $B$carpetaBusqueda\n"
		fi
	else
		printf "\n$R No se ha encontrado el directorio $B$carpetaBusqueda$R\n"
	fi
}

clear
titulo
consulta
buscarArchivo
printf "$GRIS Ingresa cualquier tecla para regresar$W\n"
read entrada_Buffer
clear
exit 0









