#!/bin/sh


if [ !$HEIGHT ] 
then
	read -p "HEIGHT from FOCUS to UNIT in FEET: " HEIGHT
	export HEIGHT
fi

startover=false

while [ 1 == 1 ]
do


	if [ ! $func ]
	then	
		echo ''
		echo '=========================='
		echo ''
		echo "Height: $HEIGHT ft."
		echo "What would you like to do?"
		echo " - afromd  == Returns angle and throw given distance"
		echo " - dfroma  == Returns distance and throw given angle"
		echo " - hfromad == Returns height of unit given distance and angle"
		echo " - reseth  == Reset height from focus plane to grid"
		echo " - exit"
		echo ''
		read -p "--> " func
	fi
		
	case $func in 
		afromd)
			. anglefromdistance.sh
			;;
			
		dfroma)
			. distancefromangle.sh
			startover=false
			;;
			
		hfromad)
			. heightfromdistang.sh
			;;
		
		reseth)
			read -p "HEIGHT from FOCUS to UNIT in FEET: " HEIGHT
			export HEIGHT
			startover=true
			unset func
			;;
			
		exit)
			exit
			;;
			
		*)
			unset func
			;;
			
	esac

	if [ $func ]
	then
		read -p 'again? [y/n/r] ' again
		case $again in 
			n)
				exit 
				;;
				
			y)
				unset func
				;;
		esac
	fi # totop	
done
