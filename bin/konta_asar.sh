#!/bin/bash
kitaba_pike() {
   echo "#asar la mulbax va pandunia" > pandunia/asar_da_mulbax.md
   echo "" >> pandunia/asar_da_mulbax.md
   echo "| bax | asar |" >> pandunia/asar_da_mulbax.md
   echo "|-----|--------|" >> pandunia/asar_da_mulbax.md
   cat temp/stats.txt >> pandunia/asar_da_mulbax.md
}


fata_leksasli_liste() {
    cat pandunia-loge.csv | cut -d '|' -f 4 > temp/logaslia.txt
    #Delete empty lines
    sed -i '/^$/d' temp/logaslia.txt
    #Delete illegal strings
    sed -i 's/:/-/g' temp/logaslia.txt
    sed -i 's/eng-/eng:/g' temp/logaslia.txt
    sed -i 's/fra-/fra:/g' temp/logaslia.txt
    sed -i 's/spa-/spa:/g' temp/logaslia.txt
    sed -i 's/por-/por:/g' temp/logaslia.txt
    sed -i 's/rus-/rus:/g' temp/logaslia.txt
    sed -i 's/ara-/ara:/g' temp/logaslia.txt
    sed -i 's/zho-/zho:/g' temp/logaslia.txt
    sed -i 's/jpn-/jpn:/g' temp/logaslia.txt
    sed -i 's/kor-/kor:/g' temp/logaslia.txt
    sed -i 's/vie-/vie:/g' temp/logaslia.txt
    sed -i 's/hin-/hin:/g' temp/logaslia.txt
    sed -i 's/ben-/ben:/g' temp/logaslia.txt
    sed -i 's/may-/may:/g' temp/logaslia.txt
    sed -i 's/swa-/swa:/g' temp/logaslia.txt
}

konta_asar() {
   filename='temp/logaslia.txt'
   n=1
   asar=0
   while read line; do
      # reading each line
      #echo "Line No. $n : $line"
      eureki=$(echo "$line" | grep -c "$1:")
      if [ $eureki = 1 ]
      then
         sum=$(echo "$line" | grep -o "...:" | wc -l)
         #echo $sum
         asar=$((asar+(10000/sum)))
         #echo $asar
      fi
      n=$((n+1))
   done < $filename
   #percent=$(bc -l <<< "scale = 1; $asar / $3")
   percent=$(printf "%.0f" $(echo "scale=2;$asar/($3*100)" | bc))
   echo "$2 $asar $3 $percent%"
   #echo "$2 $((($asar/10)/$3))%" >> temp/stats.txt
   echo "$2 $percent%" >> temp/stats.txt
   echo "$1,$asar" >> temp/asarnumbe.csv
}

fata_table() {
   #Add horizontal bar between nam e numbe
   sed 's/ / \| /g' -i temp/stats.txt
   #Add horizontal bar to line-begin
   sed 's/^/\| /' -i temp/stats.txt
   #Add horizontal bar to line-ends
   sed 's/$/ \|/' -i temp/stats.txt
}

fata_leksasli_liste

rm temp/stats.txt
rm temp/asarnumbe.csv
pan=$(cat temp/logaslia.txt | grep -c ":" )
#echo "pan $pan 100%" >> temp/stats.txt

konta_asar eng engli $pan
konta_asar fra fransi $pan
konta_asar spa espani $pan
konta_asar por portugali $pan
konta_asar rus rusi $pan

konta_asar hin hindustani $pan
konta_asar ben bangli $pan
#konta_asar fas farsi $pan
#konta_asar tur turki $pan

konta_asar zho cini $pan
konta_asar jpn niponi $pan
konta_asar kor coseni $pan
konta_asar vie vieti $pan

konta_asar may malayi $pan

konta_asar ara arabi $pan
konta_asar swa suahili $pan

#kina nam e numbe va sami linye
perl -pi -e 's/ \n/ /' temp/stats.txt

#ratiba la dayi va lili numbe, ya kolum 2
#sort -rn -k2 temp/stats.txt -o temp/stats.txt
sort --field-separator=',' --key=2 -rn temp/asarnumbe.csv -o temp/asarnumbe.csv

fata_table

kitaba_pike

