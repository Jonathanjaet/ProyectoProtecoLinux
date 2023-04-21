#!/bin/bash

## ram

free -t --mega; grep 'MemTotal' /proc/meminfo; grep 'SwapTotal' /proc/meminfo

## arquitectura

uname -m

## identificacion de version del SO

lsb_release -idc
