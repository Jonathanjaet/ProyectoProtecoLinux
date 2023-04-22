#!/bin/bash

# Colores
R='\033[1;31m'
G='\033[1;32m'
B='\033[1;34m'
W='\033[0m'
GRIS='\033[37m'

clear

printf "$R Fecha:\t$W%(%d/%m/%Y)T\n"
printf "$R Hora:\t$W%(%H:%M:%S2)T\n"
echo ""
printf "$GRIS Ingresa cualquier tecla para regresar: $W"
read buffer_entrada
clear
exit 0


