kitaba_pike() {
   echo "#numbe da panduni loge la ali bax" > pandunia/loge_du_numbe.md
   echo "" >> pandunia/loge_du_numbe.md
   echo "| bax | numbe | fen |" >> pandunia/loge_du_numbe.md
   echo "|-----|-------|-----|" >> pandunia/loge_du_numbe.md
   cat temp/stats.txt >> pandunia/loge_du_numbe.md
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
   echo "$2 $bax $((($bax*100)/$3))%" >> temp/stats.txt
}

konta_baxi_aria()
{
   echo "europi " >> temp/stats.txt
   cat temp/logaslia.txt | grep -E "(eng:|fra:|spa:|por:|deu:|rus:)" -c >> temp/stats.txt
   echo "barti " >> temp/stats.txt
   cat temp/logaslia.txt | grep -E "(hin:|urd:|ben:|tam:|tel:|kan:)" -c >> temp/stats.txt
   echo "cini " >> temp/stats.txt
   cat temp/logaslia.txt | grep -E "(zho:|yue:|wuu:)" -c >> temp/stats.txt
   echo "afriki " >> temp/stats.txt
   cat temp/logaslia.txt | grep -E "(swa:|hau:|yor:|ibo:|amh:|orm:)" -c >> temp/stats.txt
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
pan=$(cat temp/logaslia.txt | grep -c ":" )
echo "pan $pan 100%" >> temp/stats.txt

konta_bax eng engli $pan
konta_bax fra fransi $pan
konta_bax spa espani $pan
konta_bax por portugali $pan
konta_bax rus rusi $pan

konta_bax hin hindustani $pan
konta_bax ben bangli $pan
konta_bax fas farsi $pan
konta_bax tur turki $pan

konta_bax zho cini $pan
konta_bax jpn niponi $pan
konta_bax kor coseni $pan
konta_bax vie vieti $pan

konta_bax may malayi $pan

konta_bax ara arabi $pan
konta_bax swa suahili $pan

#kina nam e numbe va sami linye
perl -pi -e 's/ \n/ /' temp/stats.txt

#ratiba la dayi va lili numbe, ya kolum 2
sort -rn -k2 temp/stats.txt -o temp/stats.txt

fata_table

kitaba_pike

