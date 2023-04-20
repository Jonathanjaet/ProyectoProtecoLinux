#!/bin/bash

# Colores
R='\033[1;31m'
G='\033[1;32m'
B='\033[1;34m'
W='\033[0m'

printf "$R Fecha:\t$W%(%d/%m/%Y)T\n"
printf "$R Hora:\t$W%(%H:%M:%S2)T\n"
