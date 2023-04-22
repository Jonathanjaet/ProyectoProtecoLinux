#!/bin/bash

## ram

echo "Se muestra la memoria ram disponible: "
echo "______________________________________"

free -t --mega; grep 'MemTotal' /proc/meminfo; grep 'SwapTotal' /proc/meminfo
echo "______________________________________"
## arquitectura
echo "La arquitectura de su computadora es: "
echo "______________________________________"

uname -m
echo "______________________________________"
## identificacion de version del SO
echo "La versión de su Sistema Operativo a detalle es: "
echo "_________________________________________________"
lsb_release -idc
echo "_________________________________________________"
