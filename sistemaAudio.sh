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


