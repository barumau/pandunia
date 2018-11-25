fata_lekse_liste() {
    cat pandunia-lekse.tsv | cut -f 4,5,$1 > temp/lekse.txt
    sed -i '1d' temp/lekse.txt
    sed -i '/\t$/d' temp/lekse.txt
    cat temp/abace.txt temp/lekse.txt | sed 's/\t/@/g' | LC_ALL=C sort -f | sed 's/.00/##/g' | sed 's/@/ /g'> $2/pandunia-$2.md 
    cat $2/pandunia-$2.md | sed '/^#/ d' > temp/temp2.txt
    cat temp/temp2.txt temp/abace.txt > temp/temp.txt
    awk ' { FS=" : "; OFS=" : "; t = $1; $1 = $2; $2 = t; print; } ' temp/temp.txt | sed 's/^ : //g' | LC_ALL=C sort -f | sed 's/.00/##/g' > $2/$2-pandunia.md
    sed 's/_//g' -i $2/$2-pandunia.md
    sed 's/$/  /' -i $2/$2-pandunia.md
    sed 's/$/  /' -i $2/pandunia-$2.md
}

dos2unix pandunia-lekse.tsv

# engli i pandunia
fata_lekse_liste 6 engli

#Tiddly dictionary
cp engli/pandunia-engli.md temp/temp.txt
sed 's/_//g' -i temp/temp.txt
cat temp/tiddly_1.html temp/temp.txt temp/tiddly_3.html > engli/tiddly.html

# esperanti i pandunia
fata_lekse_liste 7 esperanto

# suomi i pandunia
fata_lekse_liste 8 suomi

# polski i pandunia
fata_lekse_liste 9 polski

# fransi i pandunia
fata_lekse_liste 13 frans


# ze pandunia to rusi
cat rusi/slovar.txt temp/abace.txt > temp/temp.txt
sed 's/	/ : /g' temp/temp.txt | LC_ALL=C sort -f | sed 's/.00/##/g' > rusi/pandunia-rusi.md
sed 's/_//g' -i rusi/pandunia-rusi.md
sed 's/$/  /' -i rusi/pandunia-rusi.md
# ze rusi to pandunia
#cat rusi/slovar.txt temp/kirilitsa.txt > temp/temp.txt
#awk ' { FS="\t"; OFS=" : "; t = $1; $1 = $2; $2 = t; print; } ' temp/temp.txt | sed 's/^ : //g' | LC_COLLATE=ru_RU.UTF-8 sort --ignore-case | sed 's/.00/##/g' > rusi/rusi-pandunia.md
cp rusi/slovar.txt temp/temp.txt
awk ' { FS="\t"; OFS=" : "; t = $1; $1 = $2; $2 = t; print; } ' temp/temp.txt | sed 's/^ : //g' > rusi/rusi-pandunia.md
sed 's/_//g' -i rusi/rusi-pandunia.md
sed 's/$/  /' -i rusi/rusi-pandunia.md


