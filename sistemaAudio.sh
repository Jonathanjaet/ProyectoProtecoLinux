#!/bin/bash

# Colores
R='\033[1;31m'
G='\033[1;32m'
B='\033[1;34m'
W='\033[0m'

# Direccion del reproductor
reproductor=/bin/mpg123

#Comprobar que si este instalado
if [ ! -f "$reproductor" ];
then
	printf "Para utilizar esta aplicación debes instalar mpg123 ¿Quieres continuar? [y/n]"
       	read instalarYN
   	case $instalarYN in
       		'y') sudo apt install mpg123 ;;
       		'n') exit 0 ;;
       		*) printf "Opción no válida, escribe \'y\' o \'n\'" ;;
	esac
fi

clear
printf "$R BIENVENIDO A PROTOMIXER\n$W"

# Variables de control
salir=0
regresar=0

# Por defecto la musica se toma de la carpeta en el proyecto
dirMusica=/musiquitaGratis


while [ $salir -ne 1 ]
do
	clear
	printf "$R PROTOMIXER\n$W"
	printf "-----------------\n"
	printf "MENU PRINCIPAL\n"
	printf "Carpeta actual: $dirMusica"
	printf "1) Reproducir canciones en modo aleatorio\n"
	printf "2) Cambiar carpeta\n"
	printf "3) Salir\n\n"

	printf "Por favor seleccione una opción\n"
	read opcion

	case $opcion in
		1) 
			clear
			mpg123 -C --title -q -z *.mp3
			;;
		2) ;;
		3) ;;
		*) printf "Opción inválida, elige una opción del menú\n" ;;
	esac

done



















