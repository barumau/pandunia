fata_leksasli_liste() {
    cat pandunia-lekse.tsv | cut -f 1 > temp/lekse.txt
    #Delete empty lines
    sed -i '/\ ← $/d' temp/lekse.txt
}

konta_bax() {
   echo "| $1 | " >> temp/stats.txt
   cat temp/lekse.txt | grep -c "$1:" >> temp/stats.txt
}

fata_leksasli_liste
#echo "# asli bax du pandunia da lekse\n" > temp/stats.txt
echo "| bax | num |" > temp/stats.txt
echo "|-----|-----|" >> temp/stats.txt
echo "|  *  | " >> temp/stats.txt
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
konta_bax pan
konta_bax per

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

perl -pi -e 's/ \n/ /' temp/stats.txt
sed 's/$/ |/' -i temp/stats.txt
sed 's/| |/|/' temp/stats.txt > pandunia/lekse_da_num.md

