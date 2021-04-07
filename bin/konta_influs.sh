#!/bin/bash
kitaba_pike() {
   echo "#influs da mulbax va pandunia" > pandunia/loge_du_influs.md
   echo "" >> pandunia/loge_du_influs.md
   echo "| bax | influs |" >> pandunia/loge_du_influs.md
   echo "|-----|--------|" >> pandunia/loge_du_influs.md
   cat temp/stats.txt >> pandunia/loge_du_influs.md
}


fata_leksasli_liste() {
    cat pandunia-loge.csv | cut -d '|' -f 5 > temp/lekse.txt
    #Delete empty lines
    sed -i '/^$/d' temp/lekse.txt
    #Delete illegal strings
    sed -i 's/:/-/g' temp/lekse.txt
    sed -i 's/eng-/eng:/g' temp/lekse.txt
    sed -i 's/fra-/fra:/g' temp/lekse.txt
    sed -i 's/spa-/spa:/g' temp/lekse.txt
    sed -i 's/por-/por:/g' temp/lekse.txt
    sed -i 's/rus-/rus:/g' temp/lekse.txt
    sed -i 's/ara-/ara:/g' temp/lekse.txt
    sed -i 's/zho-/zho:/g' temp/lekse.txt
    sed -i 's/jpn-/jpn:/g' temp/lekse.txt
    sed -i 's/kor-/kor:/g' temp/lekse.txt
    sed -i 's/vie-/vie:/g' temp/lekse.txt
    sed -i 's/hin-/hin:/g' temp/lekse.txt
    sed -i 's/ben-/ben:/g' temp/lekse.txt
    sed -i 's/may-/may:/g' temp/lekse.txt
    sed -i 's/swa-/swa:/g' temp/lekse.txt
}

konta_influs() {
   filename='temp/lekse.txt'
   n=1
   influs=0
   while read line; do
      # reading each line
      #echo "Line No. $n : $line"
      eureki=$(echo "$line" | grep -c "$1:")
      if [ $eureki = 1 ]
      then
         sum=$(echo "$line" | grep -o "...:" | wc -l)
         #echo $sum
         influs=$((influs+(1000/sum)))
         #echo $influs
      fi
      n=$((n+1))
   done < $filename
   #percent=$(bc -l <<< "scale = 1; $influs / $3")
   percent=$(printf "%.0f" $(echo "scale=2;($influs/10)/$3" | bc))
   echo $1 $percent
   #echo "$2 $((($influs/10)/$3))%" >> temp/stats.txt
   echo "$2 $percent%" >> temp/stats.txt
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
pan=$(cat temp/lekse.txt | grep -c ":" )
#echo "pan $pan 100%" >> temp/stats.txt

konta_influs eng engli $pan
konta_influs fra fransi $pan
konta_influs spa espani $pan
konta_influs por portugali $pan
konta_influs rus rusi $pan

konta_influs hin hindustani $pan
konta_influs ben bangli $pan
#konta_influs fas farsi $pan
#konta_influs tur turki $pan

konta_influs zho cini $pan
konta_influs jpn niponi $pan
konta_influs kor coseni $pan
konta_influs vie vieti $pan

konta_influs may malayi $pan

konta_influs ara arabi $pan
konta_influs swa suahili $pan

#kina nam e numbe va sami linye
perl -pi -e 's/ \n/ /' temp/stats.txt

#ratiba la dayi va lili numbe, ya kolum 2
#sort -rn -k2 temp/stats.txt -o temp/stats.txt

fata_table

kitaba_pike

