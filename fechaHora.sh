#!/bin/bash

# Colores
R='\033[1;31m'
G='\033[1;32m'
B='\033[1;34m'
W='\033[0m'

printf "$R\tFecha:\t$W%(%d/%m/%Y)T"
printf "$R\tHora:\t$W%(%H:%M:%S2)T"
