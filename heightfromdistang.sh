#!/bin/bash


read -p "ANGLE above horizontal in DEGREES: " ang
read -p "HORIZONTAL DISTANCE from subject to unit IN FEET: " dist
read -p "HEIGHT of facial plane in FEET: " face

rad=$(echo "scale=10; $ang * (3.14159265 / 180) " | bc -l)
tan=$(echo "scale=4; (s($rad) / c($rad))" | bc -l )
hgt=$(echo "scale=4 ; $dist * $tan " | bc)
thr=$(echo "scale=2 ; sqrt($hgt^2 + $dist^2)" | bc -l )

hgt=$(echo "scale=4 ; $hgt+$face " | bc -l)
echo "Height: $hgt"
echo "Throw: $thr"
