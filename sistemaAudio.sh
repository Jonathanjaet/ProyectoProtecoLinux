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
dirMusica=musiquitaGratis/


while [ $salir -ne 1 ]
do
	clear
	printf "$R PROTOMIXER\n$W"
	echo "-----------------"
	echo "MENU PRINCIPAL"
	echo "Carpeta actual: $dirMusica"
	echo "1) Reproducir canciones en modo aleatorio"
	echo "2) Cambiar carpeta"
	echo "3) Salir"

	printf "Por favor seleccione una opción\n"
	read -e opcion

	case $opcion in
		1) 
			clear
			echo "		MENU DE REPRODUCCION"
			echo "------------------------------------------"
			echo "		s) Pausar/Reproducir"
			echo "		f) Siguiente"
			echo "		b) Comenzar de nuevo"
			echo "		d) Regresar"
			echo "		q) Detener Reproducción"
			echo "-------------------------------------------"
			mpg123 -C --title -q -z "${dirMusica}"/*
			;;
		2) 
			clear
			echo "		SELECCION DE CARPETA"
			echo "------------------------------------------"
			echo "	Ingrese la ruta absoluta o relativa de	"
			echo " 	 de la carpeta donde se encuentre la"
			echo "			música"
			read -e dirMusica
			while [ ! -d $dirMusica ]
			do
				echo "Esa dirección no es válida, inténtalo nuevamente"
				read -e $dirMusica
			done
			;;
		3) exit 0 ;;
		*) printf "Opción inválida, elige una opción del menú\n" ;;
	esac

done



















