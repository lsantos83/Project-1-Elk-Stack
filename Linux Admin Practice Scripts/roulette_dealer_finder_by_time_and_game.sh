#!/bin/bash

if [ $4 == "1" ]

then
	awk -v time="$2" -v ampm="$3" '($0 ~ ("^"time)) && (tolower($2) == tolower(ampm))  {print "<Blackjack>","Time: " $1, $2,"Dealer: " $3, $4}' "$1"*

elif [ $4 == "2" ]

then
	awk -v time="$2" -v ampm="$3" '($0 ~ ("^"time)) && (tolower($2) == tolower(ampm))  {print "<TexasHoldEm>","Time: " $1, $2,"Dealer: " $7, $8}' "$1"*

elif [ $4 == "3" ]

then
	awk -v time="$2" -v ampm="$3" '($0 ~ ("^"time)) && (tolower($2) == tolower(ampm)) {print "<Roulette>","Time: " $1, $2,"Dealer: " $5, $6}' "$1"* 

fi





