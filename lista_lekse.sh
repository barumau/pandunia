fata_liste() {
    #pandunia unordi
    cat pandunia-lekse.csv | awk -F "|" "{print \$1 \" - \" \$$1 \"  \"}" > $2/pandunia-$2.md
    #morta unordi linye
    sed -i '1d' $2/pandunia-$2.md
    # alfobeta
    cat temp/abace.txt $2/pandunia-$2.md | LC_ALL=C sort -f > temp/temp.txt
    sed 's/.00/##/g' temp/temp.txt > $2/pandunia-$2.md
    #Add header
    sed -i "1s/^/# pandunia-$2\n/" $2/pandunia-$2.md
    #Delete empty translations
    sed -i '/-...$/d' $2/pandunia-$2.md

    #ali bax unordi
    cat pandunia-lekse.csv | awk -F "|" "{print \$$1 \" - \" \$1 \"  \"}" > $2/$2-pandunia.md
    #morta unordi linye
    sed -i '1d' $2/$2-pandunia.md
    # alfobeta
    cat temp/abace.txt $2/$2-pandunia.md | LC_ALL=C sort -f > temp/temp.txt
    sed 's/.00/##/g' temp/temp.txt > $2/$2-pandunia.md
    #Add header
    sed -i "1s/^/# $2-pandunia\n/" $2/$2-pandunia.md
    #Delete empty translations
    sed -i '/^.-/d' $2/$2-pandunia.md
}

fata_leksasli_liste()
{
    cat pandunia-lekse.tsv | cut -f 1,4,5,$1 > temp/lekse.txt
    #Delete first line
    sed -i '1d' temp/lekse.txt
    #Delete empty translations
    sed -i '/\t$/d' temp/lekse.txt
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
fata_liste 5 engli

#Tiddly dictionary
cp engli/pandunia-engli.md temp/temp.txt
sed 's/_//g' -i temp/temp.txt
cat temp/tiddly_1.html temp/temp.txt temp/tiddly_3.html > engli/tiddly.html

# esperanti i pandunia
fata_liste 20 esperanto

# suomi i pandunia
fata_liste 21 suomi

# polski i pandunia
fata_liste 22 polski

# cini i pandunia
fata_liste 11 cini

# rusi i pandunia
fata_liste 9 rusi

# fransi i pandunia
fata_liste 6 frans

#fata_lekse_asle

