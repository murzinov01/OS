#!bin/bash

function get_znak()
{
 echo $1 > znak.txt
 
 grep "^[ptdfPTDF][lnLN][uyaeUYAE][sczSCZ]" znak.txt > result_znak.txt
 if [ -s result_znak.txt ]
 then
  rm znak.txt result_znak.txt
  return 1
 fi
 
 grep "^[nmNM][ieuaIEUA][nmNM][uyaiIEUA][sczSCZ]" znak.txt > result_znak.txt
 if [ -s result_znak.txt ]
 then
  rm znak.txt result_znak.txt
  return 2
 fi
 
 grep "^[uyUY][mnMN][mnMN][oauyOAUY][zscZSC][yuiYUI][tdTD]\W*" znak.txt > result_znak.txt
 if [ -s result_znak.txt ]
 then
  rm znak.txt result_znak.txt
  return 3
 fi
 
 grep "^[dtpDTP][eiEI][lnmLNM][eiEI][tdTD]\W*" znak.txt > result_znak.txt
 if [ -s result_znak.txt ]
 then
  rm znak.txt result_znak.txt
  return 4
 fi
 return 0
}

function get_number()
{
 echo $1 > number.txt
 
 grep "^[nmNM][oauyOAUY][lL]*" number.txt > result.txt
 if [ -s result.txt ]
 then
  rm number.txt result.txt
  return 0
 fi
 
 grep "^[oaeiuOAEIU][dtrnDTRN].*" number.txt > result.txt
 if [ -s result.txt ]
 then
  rm number.txt result.txt
  return 1
 fi
 
 grep "^[dtprDTPR][vfhwVFHW]." number.txt > result.txt
 if [ -s result.txt ]
 then
  rm number.txt result.txt
  return 2
 fi
 
 grep "^[tpdTDP][rlnRLN]." number.txt > result.txt
 if [ -s result.txt ]
 then
  rm number.txt result.txt
  return 3
 fi
 
 grep "^[chstCHST][chstCHST][eiEI][tdTD][yuieYUIE][rR]." number.txt > result.txt
 if [ -s result.txt ]
 then
  rm number.txt result.txt
  return 4
 fi
 
 grep "^[pP][yaiYAI][tdnpTDNP]*" number.txt > result.txt
 if [ -s result.txt ]
 then
  rm number.txt result.txt
  return 5
 fi
 
 grep "^[shcSHC][shcSHC][eiaEIA][sczSCZ]\W*" number.txt > result.txt
 if [ -s result.txt ]
 then
  rm number.txt result.txt
  return 6
 fi
 
 grep "^[cszCSZ][eiaEIA][mnltMNLT]\W*" number.txt > result.txt
 if [ -s result.txt ]
 then
  rm number.txt result.txt
  return 7
 fi
 
 grep "^[vwfVWF][oauyOAUY][sczSCZ][eiaEIA]\W*" number.txt > result.txt
 if [ -s result.txt ]
 then
  rm number.txt result.txt
  return 8
 fi
 
 grep "^[dtpDTP][eiaEIA][vwfVWF][yiaYIA][tdpTDP]\W*" number.txt > result.txt
 if [ -s result.txt ]
 then
  rm number.txt result.txt
  return 9
 fi
 
 return 100
}

while true
do 
 echo vvedite pervoe chislo
 read op1
 get_number $op1
 op1=`echo $?`
 #echo $op1
 if [ "$op1" != "100" ]
 then
  break
 else
  echo "Ya tebya ne ponimau, davai vvedi echo raz"
 fi
done

while true
do 
 echo vvedite znak
 read znak
 get_znak $znak
 znak=`echo $?`
 if [ "$znak" != "0" ]
  then
   break
  else
   echo "Ya tebya ne ponimau, davai vvedi echo raz"
 fi 
done

case $znak in
  1) znak="+";;
  2) znak="-";;
  3) znak="*";;
  4) znak="/";;
esac

while true
do 
 echo vvedite vtoroe chislo
 read op2
 get_number $op2
 op2=`echo $?`
 #echo $op2
  if [ "$op2" != "100" ]
 then
  break
 else
  echo "Ya tebya ne ponimau, davai vvedi echo raz"
 fi
done

if [[ "$znak" = "/" ]] && [[ "$op2" = "0" ]] 
then
echo "user, ti durak!"
echo davai dosvidaniya
exit
fi

if [ "$znak" = "*" ]
then
  expr $op1 "*" $op2
else
  expr $op1 $znak $op2
fi
