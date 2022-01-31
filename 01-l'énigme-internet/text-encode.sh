#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ]; then
	printf "Script usage: text-encode.sh [lorem-txt] [message-txt]\nEg. text-encode.sh lorem.txt message.txt\n" && exit 0;
fi

IFS=' ' read -r -a lorem <<< $(cat $1)
IFS=' ' read -r -a message <<< $(cat $2)
MM=${#message[@]}
NN=0

FB1=2
FB2=3


for index in "${!lorem[@]}"
do
    if [ $index -eq $FB2 ] && [ $NN -lt $MM ]; then
      lorem[$(( index - 1 ))]="${message[$NN]}"
      tmp=$FB2
      ((FB2+=FB1))
      FB1=$tmp
      ((NN+=1))
    fi
done

echo "${lorem[@]}" > trois-cinq-huit-treize.txt
