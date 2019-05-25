kitaba_pike() {
   echo "#lekse da num sa bax" > pandunia/lekse_da_num.md
   echo "" >> pandunia/lekse_da_num.md
   echo "| bax | num |" >> pandunia/lekse_da_num.md
   echo "|-----|-----|" >> pandunia/lekse_da_num.md
   cat temp/stats.txt >> pandunia/lekse_da_num.md
}

fata_leksasli_liste() {
    cat pandunia-lekse.tsv | cut -f 1 > temp/lekse.txt
    #Delete empty lines
    sed -i '/\ ← $/d' temp/lekse.txt
}

konta_bax() {
   echo "$2 " >> temp/stats.txt
   cat temp/lekse.txt | grep -c "$1:" >> temp/stats.txt
}

konta_baxi_aria()
{
   echo "europi " >> temp/stats.txt
   cat temp/lekse.txt | grep -E "(eng:|fra:|spa:|por:|deu:|rus:)" -c >> temp/stats.txt
   echo "barti " >> temp/stats.txt
   cat temp/lekse.txt | grep -E "(hin:|urd:|ben:|tam:|tel:|kan:)" -c >> temp/stats.txt
   echo "cini " >> temp/stats.txt
   cat temp/lekse.txt | grep -E "(zho:|yue:|wuu:)" -c >> temp/stats.txt
   echo "afriki " >> temp/stats.txt
   cat temp/lekse.txt | grep -E "(swa:|hau:|yor:|ibo:|amh:|orm:)" -c >> temp/stats.txt
}

fata_table() {
   #Add horizontal bar between nam i num
   sed 's/ / \| /g' -i temp/stats.txt
   #Add horizontal bar to line-begin
   sed 's/^/\| /' -i temp/stats.txt
   #Add horizontal bar to line-ends
   sed 's/$/ \|/' -i temp/stats.txt
}

fata_leksasli_liste

rm temp/stats.txt

echo "pan " >> temp/stats.txt
cat temp/lekse.txt | grep -c ":" >> temp/stats.txt

konta_bax eng engli
konta_bax deu doici
konta_bax fra fransi
konta_bax spa espani
konta_bax por portugali
konta_bax rus rusi
konta_bax pol polski

konta_bax hin hindi
konta_bax urd urdi
konta_bax ben bangli
konta_bax pnb panjabi
konta_bax fas farsi

konta_bax tam tamili
konta_bax tel telugi
konta_bax tur turki

konta_bax zho cini
konta_bax jpn niponi
konta_bax kor hangugi
konta_bax vie wieti
konta_bax tha tayi

konta_bax ind indonesi
konta_bax tgl filipini

konta_bax ara arabi
konta_bax amh amari
konta_bax orm oromi
konta_bax hau hausi

konta_bax yor yorubi
konta_bax ibo "ibo'i"
konta_bax swa swahili
konta_bax zul "zulu'i"

#kina nam i num pa sam linye
perl -pi -e 's/ \n/ /' temp/stats.txt

#orda ya day pa lil num, sa kolum 2
sort -rn -k2 temp/stats.txt -o temp/stats.txt

fata_table

kitaba_pike

