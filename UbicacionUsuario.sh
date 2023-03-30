#!/bin/bash
declare -i salida=0

declare -i opt=1

comando=""

fecha=$(date +"Hoy es: %A %d %B")

ram=$(free -t --mega; grep 'MemTotal' /proc/meminfo; grep 'SwapTotal' /proc/mem>

arqui=$(sudo lshw -C CPU | grep width)

versionSO=$(lsb_release -idc)
# se cancela el uso del ctrl+c mientras ejecuta el script
trap ctrl_c INT 
# inicio del segundo script
while [ $opt != $salida ]
do
    echo $USER
    pwd
    
    echo "Tu decides si sales $USER"
    echo "Tus opciones de comandos son: "
    echo "[ ram, arqui, versionSO , fechaElegante ]" 
    read -p "Ingrese el comando a leer: " comando
    # aun por arreglar el if
    if [ $comando == "fechaElegante" ]
    then
           echo "$fechaElegante"
    elif [ $comando == "ram" ]
           echo "$ram"
    elif [ $comando == "versionSO" ]
           echo "$versionSO"
    elif [ $comando == "arqui" ]
           echo "$arqui"
    fi
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
