#!/bin/bash

# Colores
R='\033[1;31m'
G='\033[1;32m'
B='\033[1;34m'
W='\033[0m'

prompt(){
	printf "$R$(whoami)$W:$B$(pwd)$W~& "

}

# Funcion para manejo de senal SIGINT (^C) y SIGTSTP (^Z)
function sigint_handler(){
	printf "\nPara salir utilice el comando \'salir\'\n"
	prompt
}



# Capturar senal SIGINT (^C) y SIGTSTP (^Z)
trap sigint_handler SIGINT SIGTSTP

main(){
	clear

	while true
	do
	prompt
	read comando

	case $comando in
		limpiar) clear ;;
		salir) exit 0 ;;
		infosis) ./InfoSis.sh ;;
		tiempo) ./fechaHora.sh ;;
		ayuda) cat ayuda.txt ;; 
		jugar) ./gato.sh ;;
		creditos) cat creditos.txt ;;
		buscar) ./busqueda.sh;;
		audio) ./sistemaAudio.sh;;
		*) $comando ;;

	esac
	done
}

./verificarUsuario.sh
main
