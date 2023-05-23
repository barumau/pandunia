#!/bin/bash
kitaba_pike() {
   echo "# nume de pandunia lexe de alo baxe" > pandunia/lexi_nume.md
   echo "" >> pandunia/lexi_nume.md
   echo "| baxe  | nume  | fen |" >> pandunia/lexi_nume.md
   echo "|-------|-------|-----|" >> pandunia/lexi_nume.md
   cat temp/stats.txt >> pandunia/lexi_nume.md
}

fata_leksasli_liste() {
    cat lexi.csv | cut -d '|' -f 5 > temp/lexasle.txt
    #Delete empty lines
    sed -i '/^$/d' temp/lexasle.txt
}

konta_bax() {
   # uza grep va konta di konte
   bax=$(cat temp/lexasle.txt | grep -c "$1:")
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
pan=$(cat temp/lexasle.txt | grep -c ":" )
echo "pan $pan 100%" >> temp/stats.txt

konta_bax eng englix $pan
konta_bax deu doice $pan
konta_bax fra franse $pan
konta_bax spa espanya $pan
konta_bax por portugal $pan
konta_bax rus rus $pan

konta_bax hin hindi $pan
konta_bax ben bangla $pan
konta_bax tam tamil $pan
konta_bax fas parsi $pan
konta_bax tur turki $pan

konta_bax zho putonghan $pan
konta_bax yue guangdonghan $pan
konta_bax jpn nipon $pan
konta_bax kor cosen $pan
konta_bax vie viet $pan

konta_bax may malayu $pan

konta_bax ara arabi $pan
konta_bax swa suahili $pan
konta_bax hau hausa $pan
konta_bax ful ful $pan

#kina nam e numbe va sami linye
perl -pi -e 's/ \n/ /' temp/stats.txt

#ratiba la dayi va lili numbe, ya kolum 2
sort -rn -k2 temp/stats.txt -o temp/stats.txt
sort --field-separator=',' --key=2 -rn temp/logonumbe.csv -o temp/logonumbe.csv

fata_table

kitaba_pike

