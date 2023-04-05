#!/bin/bash
# primer script

sudo login

#scomandos del tercer script

trap ctrl_c INT

# comandos ayuda de sentencias

declare -i salida=0

declare -i opt=1

comando=""
#comandos del cuarto script
fecha=$(date "+Hoy es: %A %d %B%n Hora: %T")

ram=$(free -t --mega; grep 'MemTotal' /proc/meminfo; grep 'SwapTotal' /proc/meminfo)

arqui=$(uname -m)

versionSO=$(lsb_release -idc)


while [ $opt != $salida ]
do
        
        #Segundo script
        pwd
        echo "Hola $USER"

        echo "Tu decides si sales $USER\n"
        echo "Tus opciones de comandos son: "
        echo "[ ram, arqui, versionSO , fecha ]" 
        read -p "Ingrese el comando a leer: " comando

        if [ $comando == "fecha" ]
        then
                echo "$fecha"
        elif [ $comando == "ram" ]
        then
                echo "$ram"
        elif [ $comando == "versionSO" ]
        then
                echo "$versionSO"
        elif [ $comando == "arqui" ]
        then
                echo "$arqui"
        else
                echo "Opcion invalida, ingrese una opcion valida"
        fi

        read -p "Desea salir [1] o continuar[0]: " salida
        echo "$INTRO"
        clear
done

echo "Vuelve pronto!"

