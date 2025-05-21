#!/bin/bash

# Author: Otávio Escalante

# Description: Script for generating random passwords


upper="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
lower="abcdefghijklmnopqrstuvwxyz"
numbers="0123456789"
special_characters="!@#$%&*()-_=+[]{}<>?/"

red="\e[1;31m"
green="\e[1;32m"
reset="\e[0m"

read -p "Include upper letters (s/S): " include_upper
read -p "Include lower letters (s/S): " include_lower
read -p "Include numbers (s/S): " include_numbers
read -p "Include characters (s/S): " include_characters

characters=""

[[ "$include_upper" =~ ^[sS]$ ]] && characters+="$upper"
[[ "$include_lower" =~ ^[sS]$ ]] && characters+="$lower"
[[ "$include_numbers" =~ ^[sS]$ ]] && characters+="$numbers"
[[ "$include_characters" =~ ^[sS]$ ]] && characters+="$special_characters"

if [[ -z "$characters" ]]; then
	echo  -e "${red}You must specify at least one character!"
	exit 1
fi

read -p "Enter the password size (ex: 20)" size

password=$(tr -dc "$characters" < /dev/urandom | head -c $size )

echo -e "${green}Successfully generated password: ${reset}$password"
