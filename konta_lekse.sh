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

konta_bax eng English
konta_bax deu German
konta_bax fra French
konta_bax spa Spanish
konta_bax por Portuguese
konta_bax rus Russian
konta_bax pol Polish

konta_bax hin Hindi
konta_bax urd Urdu
konta_bax ben Bengali
konta_bax pnb Punjabi
konta_bax fas Farsi

konta_bax tur Turkish

konta_bax zho Chinese
konta_bax jpn Japanese
konta_bax kor Korean
konta_bax vie Vietnamese
konta_bax tha Thai

konta_bax ind Indonesian
konta_bax tgl Filipino

konta_bax ara Arabic
konta_bax amh Amharic
konta_bax orm Oromo
konta_bax hau Hausa

konta_bax yor Yoruba
konta_bax ibo Igbo
konta_bax swa Swahili
konta_bax zul Zulu

#kina nam i num pa sam linye
perl -pi -e 's/ \n/ /' temp/stats.txt

#orda ya day pa lil num, sa kolum 2
sort -rn -k2 temp/stats.txt -o temp/stats.txt

fata_table

kitaba_pike

