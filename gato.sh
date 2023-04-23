#!/bin/bash

# Colores
R='\033[1;31m'
G='\033[1;32m'
B='\033[1;34m'
M='\033[1;35m' # Magenta
W='\033[0m'

# Se declara en un arreglo los valores que simbolizan cada casilla
s=([1]=1 [2]=2 [3]=3 [4]=4 [5]=5 [6]=6 [7]=7 [8]=8 [9]=9)

# Simbolos para cada jugador
SIMBOLO_JUGADOR1=X
SIMBOLO_JUGADOR2=O

# Funcion para dibujar el tablero
dibujarTablero() {

	printf "$M    _  _    _____       _          _  _\n"
	printf "  _| || |_ / ____|     | |       _| || |_\n"
	printf " |_  __  _| |  __  __ _| |_ ___ |_  __  _|\n"
	printf "  _| || |_| | |_ |/ _' | __/ _ \ _| || |\n"
	printf " |_  __  _| |__| | (_| | || (_) |_  __  _|\n"
	printf "   |_||_|  \_____|\__,_|\__\___/  |_||_|  $W\n"
	echo ""
	printf "$M=================================================$W"
	echo ""
	printf "$R 	  Jugador 1: ${SIMBOLO_JUGADOR1}$W, $B Jugador 2: ${SIMBOLO_JUGADOR2}$W\n"
	echo ""
	printf "		${s[7]} | ${s[8]} | ${s[9]}\n"
	echo "               ---+---+---"
	printf "		${s[4]} | ${s[5]} | ${s[6]}\n"
	echo "               ---+---+---"
	printf "		${s[1]} | ${s[2]} | ${s[3]}\n"
}

# Expresion regular para verificar que el valor este entre 1 y 9
RANGO_NUM='^[1-9]$'

# Funcion para pedirle al jugador 1 su entrada
Turno_jugador1() {
	printf "	Elige una casilla (1-9):"
	read casilla
	if ! [[ $casilla =~ $RANGO_NUM ]]; then
		echo "	  Debes escoger un numero entre 1 y 9"
		Turno_jugador1
	fi

	if ! [[ ${s[$casilla]} =~ $RANGO_NUM ]]; then
		echo "	  Casilla ocupada"
		Turno_jugador1
	fi
	s[$casilla]=$SIMBOLO_JUGADOR1
}

# Funcion para pedirle al jugador 2 su entrada
Turno_jugador2(){
	printf "	Elige una casilla (1-9):"
	read casilla
	if ! [[ $casilla =~ $RANGO_NUM ]]; then
		echo "	  Debes escoger un numero 1 y 9"
		Turno_jugador2
	fi

	if ! [[ ${s[$casilla]} =~ $RANGO_NUM ]]; then
		echo "	  Casilla ocupada"
		Turno_jugador2
	fi
	s[$casilla]=$SIMBOLO_JUGADOR2
}

# Funcion para saber qué jugador se debe imprimir
jugador() {
	local SIMBOLO=$1
	[[ $SIMBOLO == $SIMBOLO_JUGADOR1 ]] && printf "Jugador 1" || printf "Jugador 2"
	

}

# Funcion para mostrar al ganador
gana() {
	local GANADOR=$1
	echo "    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
	echo "	     $(jugador $GANADOR) gana!"
	echo "    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
	echo ""
	read -p "Ingresa una tecla para continuar: " buffer_tecla
	clear
	exit 0
}

# Funcion para evaluar casos de victoria
verificarGanador(){

	# Evaluar filas
	for i in 1 4 7; do
		j=$(($i + 1))
		k=$(($i + 2))
		GANADOR=${s[$i]}
		[[ ${s[$i]} == ${s[$j]} ]] && [[ ${s[$j]} == ${s[$k]} ]] && gana $GANADOR
	done

	# Evaluar columnas
	for i in 1 2 3; do
		j=$(($i + 3))
		k=$(($i + 6))
		GANADOR=${s[$i]}
		[[ ${s[$i]} == ${s[$j]} ]] && [[ ${s[$j]} == ${s[$k]} ]] && gana $GANADOR
	done

	# Evaluar diagonales
	GANADOR=${s[5]}
	[[ ${s[1]} == ${s[5]} ]] && [[ ${s[5]} == ${s[9]} ]] && gana $GANADOR
	[[ ${s[7]} == ${s[5]} ]] && [[ ${s[5]} == ${s[3]} ]] && gana $GANADOR
	
}


while true; do
	clear
	dibujarTablero
	printf "\n$R	Turno jugador 1$W"
	Turno_jugador1
	verificarGanador
	echo ""
	printf "\n$B	Turno jugador 2$W"
	Turno_jugador2
	verificarGanador
done






