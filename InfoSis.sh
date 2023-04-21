#!/bin/bash

## son solo comandos, no es funcional para el proyecto

free -t --mega

grep 'MemTotal' /proc/meminfo; grep 'SwapTotal' /proc/meminfo



## para mostrar la arquitectura de la computadora;

sudo lshw -C CPU | grep width




## identificacion de version del SO

lsb_release -idc
