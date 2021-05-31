#!/bin/bash

awk -v time="$2" -v ampm="$3" '($0 ~ ("^"time)) && (tolower($2) == tolower(ampm)) {print "<Roulette> Time: " $1, $2, "Dealer: " $5, $6}' "$1"* 


