#!/bin/bash

# Se declara en un arreglo los valores que simbolizan cada casilla
S = ([1]=1 [2]=2 [3]=3 [4]=4 [5]=5 [6]=6 [7]=7 [8]=8 [9]=9)

# Simbolos para cada jugador
SIMBOLO_JUGADOR1=X
SIMBOLO_JUGADOR2=O

# Funcion para dibujar el tablero
draw() {
	echo "Jugador 1: ${SIMBOLO_JUGADOR1}, Jugador 2: ${SIMBOLO_JUGADOR2}"
	echo " ${s[7]} | ${s[8]} | ${s[9]} "
	echo "---+---+---"
	echo " ${s[4]} | ${s[5]} | ${s[6]} "
	echo "---+---+---"
	echo " ${s[1]} | ${s[2]} | ${s[3]} "
}


