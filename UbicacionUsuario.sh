#!/bin/bash

declare -i salida=0
declare -i opt=1
# se cancela el uso del ctrl+c mientras ejecuta el script
trap ctrl_c INT 
# inicio del segundo script
while [ $opt != $salida ]
do
    echo $USER
    pwd
    
    echo "Tu decides si sales $USER"
    
    read -p "Desea salir [1] o continuar[0]: " salida
    echo "$INTRO"
    
done

# inicio del tercer script

cat .bashrc

echo 'alias lm="ls -la"' >> .bashrc

source ~/.bashrc

cat .bashrc

# no funciona aún

echo 'alias yaquedo="cd ..; ls -la"' >> .bashrc

cat .bashrc

source .bashrc


PATH=$(dirname "${BASH_SOURCE[0]}")/bin:$PATH
export PATH
porfin() {
    cd ..; ls -la
}
 # requiere confirmar con source ./bashrc
# se intentó de otra forma y no funcionó, seguire intentando y borrare mañana lo que no funcionó
