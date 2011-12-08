#!/bin/bash


read -p "ANGLE above horizontal in DEGREES: " ang
rad=$(echo "scale=10; $ang * (3.14159265 / 180) " | bc -l)
tan=$(echo "scale=4; (s($rad) / c($rad))" | bc -l )
DIST=$(echo "scale=4 ; $HEIGHT / $tan " | bc)
thr=$(echo "scale=2 ; sqrt($HEIGHT^2 + $DIST^2)" | bc -l )
echo "Distance: $DIST"
echo "Throw: $thr"
