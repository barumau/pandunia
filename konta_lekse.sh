kitaba_pike() {
   echo "#lekse da num sa baxokode" > pandunia/lekse_da_num.md
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
   echo "$1 " >> temp/stats.txt
   cat temp/lekse.txt | grep -c "$1:" >> temp/stats.txt
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

konta_bax eng
konta_bax deu
konta_bax fra
konta_bax spa
konta_bax por
konta_bax rus
konta_bax pol

konta_bax hin
konta_bax urd
konta_bax ben
konta_bax pnb
konta_bax fas

konta_bax tur

konta_bax zho
konta_bax jpn
konta_bax kor
konta_bax vie

konta_bax ind
konta_bax tgl

konta_bax ara
konta_bax amh
konta_bax orm
konta_bax hau

konta_bax yor
konta_bax ibo
konta_bax swa
konta_bax zul

#kina nam i num pa sam linye
perl -pi -e 's/ \n/ /' temp/stats.txt

#orda ya day pa lil num, sa kolum 2
sort -rn -k2 temp/stats.txt -o temp/stats.txt

fata_table

kitaba_pike

