#!/bin/bash
echo "Ejecutando" $0

#7z l data2

fname=$1
fnew="aaa"
count=0

while true;
do
echo INICIO $fname
7z l $fname > /dev/null 2>&1 
comprobacion=$?
if [ $comprobacion == 0 ]
then
	echo "Es descomprimible";
	fnew=`7z l $fname | grep "Name" -A 2 | tail -1 | awk 'NF{print $NF}'`
	echo Contenido $fnew;
	7z x $fname > /dev/null
	echo archivo $fname DEScomprimido
	
	fname=$fnew
	fnew="basura"
	echo NUEVO NOMBRE $fname
else
	echo "No es descomprimible";
	exit 1;
fi;
count=`expr $count + 1`
echo ""
echo iteracion $count
done;
