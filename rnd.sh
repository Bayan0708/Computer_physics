x=0
for num in {1..500}
do
  r=$RANDOM
  if [[ $r -lt 16383 ]]
  then
    p=1
  else
    p=-1
  fi
  x=`echo "$x+$p" | bc `
  echo "$num $x"
done

