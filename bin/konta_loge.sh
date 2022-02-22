#!/bin/bash
kitaba_pike() {
   echo "# nomer da pandunia loga ze alo basha" > pandunia/loga_di_numbe.md
   echo "" >> pandunia/loga_di_numbe.md
   echo "| basha | nomer | fen |" >> pandunia/loga_di_numbe.md
   echo "|-------|-------|-----|" >> pandunia/loga_di_numbe.md
   cat temp/stats.txt >> pandunia/loga_di_numbe.md
}

fata_leksasli_liste() {
    cat pandunia-loge.csv | cut -d '|' -f 5 > temp/logaslia.txt
    #Delete empty lines
    sed -i '/^$/d' temp/logaslia.txt
}

konta_bax() {
   # uza grep va konta di konte
   bax=$(cat temp/logaslia.txt | grep -c "$1:")
   #kitaba konte e 100-fen
   percent=$(printf "%.0f" $(echo "scale=2;($bax*100)/$3" | bc))
   echo "$2 $bax $percent%" >> temp/stats.txt
   echo "$1,$percent" >> temp/logonumbe.csv
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
rm temp/logonumbe.csv
pan=$(cat temp/logaslia.txt | grep -c ":" )
echo "pan $pan 100%" >> temp/stats.txt

konta_bax eng english $pan
konta_bax fra france $pan
konta_bax spa espanya $pan
konta_bax por portugal $pan
konta_bax rus rus $pan

konta_bax hin hindi $pan
konta_bax ben bangla $pan
#konta_bax fas farsi $pan
#konta_bax tur turki $pan

konta_bax zho putonghan $pan
konta_bax jpn nipon $pan
konta_bax kor chosen $pan
konta_bax vie viet $pan

konta_bax may malayu $pan

konta_bax ara arabi $pan
konta_bax swa suahili $pan

#kina nam e numbe va sami linye
perl -pi -e 's/ \n/ /' temp/stats.txt

#ratiba la dayi va lili numbe, ya kolum 2
sort -rn -k2 temp/stats.txt -o temp/stats.txt
sort --field-separator=',' --key=2 -rn temp/logonumbe.csv -o temp/logonumbe.csv

#Insert before the first line
sed -i '1 i -,0' temp/logonumbe.csv
#Append after the last line
sed -i '$ a -,0' temp/logonumbe.csv

fata_table

kitaba_pike

