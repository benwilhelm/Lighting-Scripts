#!/bin/bash


read -p "DISTANCE from FOCUS to UNIT in FEET: " DIST
ratio=$(echo "scale=10; $HEIGHT / $DIST" | bc)
ang=$(echo "scale=10 ; a($ratio) / (3.14159265 / 180) " | bc -l )
thr=$(echo "scale=1 ; sqrt($HEIGHT^2 + $DIST^2)" | bc -l )
printf "Angle: %.0f deg.\n" $ang  
echo "Throw: $thr ft." 
