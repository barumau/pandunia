fata_lekse_liste() {
    cat pandunia-lekse.tsv | cut -f 4,5,$1 > temp/lekse.txt
    #Delete first line
    sed -i '1d' temp/lekse.txt
    #Delete empty translations
    sed -i '/\t$/d' temp/lekse.txt
    #Add alphabet headers
    cat temp/abace.txt temp/lekse.txt | sed 's/\t/@/g' | LC_ALL=C sort -f | sed 's/.00/##/g' | sed 's/@/ /g'> $2/pandunia-$2.md 
    #Reverse order of languages
    cat $2/pandunia-$2.md | sed '/^#/ d' > temp/temp2.txt
    cat temp/temp2.txt temp/abace.txt > temp/temp.txt
    awk ' { FS=" : "; OFS=" : "; t = $1; $1 = $2; $2 = t; print; } ' temp/temp.txt | sed 's/^ : //g' | LC_ALL=C sort -f | sed 's/.00/##/g' > $2/$2-pandunia.md
    sed 's/_//g' -i $2/$2-pandunia.md
    #Add two spaces to line-ends
    sed 's/$/  /' -i $2/$2-pandunia.md
    sed 's/$/  /' -i $2/pandunia-$2.md
}

fata_lekse_asle() {
    cat pandunia-lekse.tsv | cut -f 1,4 > temp/lekse.txt
    sed -i '1d' temp/lekse.txt
    sed -i 's/\t/ ← /g' temp/lekse.txt
    awk ' { FS=" ← "; OFS=" ← "; t = $1; $1 = $2; $2 = t; print; } ' temp/lekse.txt > temp/temp.txt
    #Delete empty etymologies
    sed -i '/\ ← $/d' temp/temp.txt
    cat temp/abace.txt temp/temp.txt | sed 's/\t/@/g' | LC_ALL=C sort -f | sed 's/.00/##/g' | sed 's/@/ /g'> temp/lekse.txt
    #Add two spaces to line-ends
    sed 's/$/  /' -i temp/lekse.txt
    cat pandunia/loge_asle_supre.md temp/lekse.txt > pandunia/loge_asle.md
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

# cini i pandunia
fata_lekse_liste 12 cini

# rusi i pandunia
fata_lekse_liste 13 rusi

# fransi i pandunia
fata_lekse_liste 14 frans

fata_lekse_asle

