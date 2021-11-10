#!/bin/bash

sumar_valores () {
	for i in 0 1
		do
		 echo "Ingrese valor #$i: "
		 read varnum
		 if [[ $varnum -gt 100 ]]
		 then
		 	arr[$i]=$varnum
		 else
		 	echo "Ingrese un valor mayor a 100."
		 	echo "Ingrese valor #$i: "
			read varnum
			arr[$i]=$varnum
		 fi
		done
	suma=$((arr[0] + arr[1]))
	echo la suma de sus valroes es : $suma
}
sumar_valores