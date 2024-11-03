x=0
for num in {1..500}
do
  r=$RANDOM
  paso=$(($RANDOM%10))
  if [[ $r -lt 16383 ]]
  then
    p=`echo "$paso/10" | bc -l`
  else
    p=`echo "-$paso/10" | bc -l`
  fi
  x=`echo "$x+$p" | bc `
  echo "$num $x "
done
