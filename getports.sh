#!/bin/bash

helpSt=$'Use: Provide a grepnmap file and get the open ports\n\nParameters:\n -A: filtered and open\n -F: only filtered'


if [ -z $1 ]; then
        echo "I need a file to get the ports :D";
        echo "$helpSt";
        exit 1;
fi
if [[ $1 == "-h" ]]; then
        echo "$helpSt";
        exit 0;
fi

regexOpen="([0-9]+/open)"
regexFil="([0-9]+/filtered)"

regexFinal=$regexOpen
if [[ $2 == "-A" ]]; then
        regexFinal="${regexOpen}|${regexFil}"
elif [[ $2 == "-F" ]]; then
        regexFinal=$regexFil;
fi

archivo=$1

cat $archivo | grep -Eo $regexFinal | grep -Eo "[0-9]+" | tr "\n" "," | sed 's/,$//g'
