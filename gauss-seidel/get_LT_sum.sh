#!/bin/bash

STARTLINE=`grep -n "^\[1\][ ]*\[2\].*Instructions" $1 | awk '{print substr($1,0,length($1)-4)}'`
ENDLINE=`grep -n "^Resources:$" $1 | awk '{print substr($1,0,length($1)-11)}'`
awk -v STARTL="$STARTLINE" -v ENDL="$ENDLINE" 'NR > STARTL && NR < ENDL {sum += $2} END {print sum}' $1
