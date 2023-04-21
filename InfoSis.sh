#!/bin/bash

## ram

free -t --mega; grep 'MemTotal' /proc/meminfo; grep 'SwapTotal' /proc/meminfo

## arquitectura

uname -m; sudo lshw -C CPU | grep width

## identificacion de version del SO

lsb_release -idc
