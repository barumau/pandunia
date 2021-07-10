fata_liste_pandunia_X() {
    #pandunia unodo
    cat pandunia-loge.csv | awk -F "|" "{gsub(/\*/,\"\\\*\",\$2); print \$1	 \" - \" \$$1 \"  \"}" > $2/pandunia-$2.md
    #morta unodi linye
    sed -i '1d' $2/pandunia-$2.md
    # alfobeta
    sed -i 's/[A-Z] - .*$/####&/' $2/pandunia-$2.md
    #Add header
    sed -i "1s/^/# pandunia-$2\n/" $2/pandunia-$2.md
    #Delete empty translations
    sed -i '/-...$/d' $2/pandunia-$2.md
}

fata_liste_X_pandunia() {
    #ali bax unodo
    cat pandunia-loge.csv | awk -F "|" "{gsub(/\*/,\"\\\*\",\$2); print \$$1 \" - \" \$1 \"  \"}" > $2/$2-pandunia.md
    #morta unodi linye
    sed -i '1d' $2/$2-pandunia.md
    # alfobeta
    cat $2/$2-pandunia.md | LC_ALL=C sort -f > temp/temp.txt
    cat temp/temp.txt | sed 's/[A-Z] - .*$/####&/' > $2/$2-pandunia.md
    #Add header
    sed -i "1s/^/# $2-pandunia\n/" $2/$2-pandunia.md
    #Delete empty translations
    sed -i '/^.-/d' $2/$2-pandunia.md
}

fata_leksasli_liste() {
#    cat pandunia-loge.csv | awk -F "|" "{print \$$1 \$1 \$4 }" > $2/leksaslia.md
    cat pandunia-loge.csv | awk -F "|" "{print \"|**\" \$1 \"**|\" \$$1 \"|\" \$4 \"|\"}" > $2/leksaslia.md
    #morta unodi linye
    sed -i '1d' $2/leksaslia.md
    #Sort
    LC_ALL=C sort -f $2/leksaslia.md --output $2/leksaslia.md
    #Add header row
    sed -i "1s/^/| pandunia | $2 | logasle |\n/" $2/leksaslia.md
    #Add header
    sed -i "1s/^/# pandunia-$2 ha logasle\n/" $2/leksaslia.md
    #Delete empty translations
    sed -i '/||/d' $2/leksaslia.md
    #xula linye 2
    sed 's/|\*\*--/|--/' -i $2/leksaslia.md
    sed 's/--\*\*|/--|/' -i $2/leksaslia.md
}

fata_liste() {
    echo cana logoliste pa $2
    fata_liste_pandunia_X $1 $2
    fata_liste_X_pandunia $1 $2
    fata_leksasli_liste $1 $2
}

fata_lekse_asle() {
    cat pandunia-loge.tsv | cut -f 2,5 > temp/lekse.txt
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

tarja_logaslia_pa_engli() {
    cd engli
    sed 's/amh:/Amharic:/' -i leksaslia.md
    sed 's/ara:/Arabic:/' -i leksaslia.md
    sed 's/ben:/Bengali:/' -i leksaslia.md
    sed 's/egy:/Egyptian-Arabic:/' -i leksaslia.md
    sed 's/ell:/Greek:/' -i leksaslia.md
    sed 's/eng:/English:/' -i leksaslia.md
    sed 's/fas:/Persian:/' -i leksaslia.md
    sed 's/fra:/French:/' -i leksaslia.md
    sed 's/ful:/Fulani:/' -i leksaslia.md
    sed 's/guj:/Gujarati:/' -i leksaslia.md
    sed 's/hak:/Hakka-Chinese:/' -i leksaslia.md
    sed 's/hau:/Hausa:/' -i leksaslia.md
    sed 's/hin:/Hindi:/' -i leksaslia.md
    sed 's/hun:/Hungarian:/' -i leksaslia.md
    sed 's/ibo:/Igbo:/' -i leksaslia.md
    sed 's/ita:/Italian:/' -i leksaslia.md
    sed 's/jpn:/Japanese:/' -i leksaslia.md
    sed 's/kan:/Kannada:/' -i leksaslia.md
    sed 's/khm:/Khmer:/' -i leksaslia.md
    sed 's/kon:/Kongo:/' -i leksaslia.md
    sed 's/kor:/Korean:/' -i leksaslia.md
    sed 's/lin:/Lingala:/' -i leksaslia.md
    sed 's/ltn:/Latin:/' -i leksaslia.md
    sed 's/mal:/Malayalam:/' -i leksaslia.md
    sed 's/mar:/Marathi:/' -i leksaslia.md
    sed 's/may:/Malay:/' -i leksaslia.md
    sed 's/min:/Min-Chinese:/' -i leksaslia.md
    sed 's/mya:/Burmese:/' -i leksaslia.md
    sed 's/orm:/Oromo:/' -i leksaslia.md
    sed 's/pnb:/Punjabi:/' -i leksaslia.md
    sed 's/pol:/Polish:/' -i leksaslia.md
    sed 's/por:/Portuguese:/' -i leksaslia.md
    sed 's/rus:/Russian:/' -i leksaslia.md
    sed 's/san:/Sanskrit:/' -i leksaslia.md
    sed 's/spa:/Spanish:/' -i leksaslia.md
    sed 's/swa:/Swahili:/' -i leksaslia.md
    sed 's/tam:/Tamil:/' -i leksaslia.md
    sed 's/tel:/Telugu:/' -i leksaslia.md
    sed 's/tgl:/Filipino:/' -i leksaslia.md
    sed 's/tha:/Thai:/' -i leksaslia.md
    sed 's/tur:/Turkish:/' -i leksaslia.md
    sed 's/urd:/Urdu:/' -i leksaslia.md
    sed 's/vie:/Vietnamese:/' -i leksaslia.md
    sed 's/wol:/Wolof:/' -i leksaslia.md
    sed 's/wuu:/Wu-Chinese:/' -i leksaslia.md
    sed 's/yor:/Yoruba:/' -i leksaslia.md
    sed 's/yue:/Cantonese:/' -i leksaslia.md
    sed 's/zho:/Mandarin:/' -i leksaslia.md
    sed 's/zul:/Zulu:/' -i leksaslia.md
    cd ..
}

tarja_logaslia_pa_suomi() {
    cd suomi
    sed 's/amh:/amhara:/' -i leksaslia.md
    sed 's/ara:/arabia:/' -i leksaslia.md
    sed 's/ben:/bangla:/' -i leksaslia.md
    sed 's/egy:/egyptinarabia:/' -i leksaslia.md
    sed 's/ell:/kreikka:/' -i leksaslia.md
    sed 's/eng:/englanti:/' -i leksaslia.md
    sed 's/fas:/persia:/' -i leksaslia.md
    sed 's/fra:/ranska:/' -i leksaslia.md
    sed 's/ful:/fulani:/' -i leksaslia.md
    sed 's/guj:/gujarati:/' -i leksaslia.md
    sed 's/hak:/hakkakiina:/' -i leksaslia.md
    sed 's/hau:/hausa:/' -i leksaslia.md
    sed 's/hin:/hindi:/' -i leksaslia.md
    sed 's/hun:/unkari:/' -i leksaslia.md
    sed 's/ibo:/igbo:/' -i leksaslia.md
    sed 's/ita:/italia:/' -i leksaslia.md
    sed 's/jpn:/japani:/' -i leksaslia.md
    sed 's/kan:/kannada:/' -i leksaslia.md
    sed 's/khm:/khmer:/' -i leksaslia.md
    sed 's/kon:/Kongo:/' -i leksaslia.md
    sed 's/kor:/korea:/' -i leksaslia.md
    sed 's/lin:/lingala:/' -i leksaslia.md
    sed 's/ltn:/latina:/' -i leksaslia.md
    sed 's/mal:/malayalam:/' -i leksaslia.md
    sed 's/mar:/marathi:/' -i leksaslia.md
    sed 's/may:/malaiji:/' -i leksaslia.md
    sed 's/min:/min-kiina:/' -i leksaslia.md
    sed 's/mya:/burma:/' -i leksaslia.md
    sed 's/orm:/oromo:/' -i leksaslia.md
    sed 's/pnb:/pandzabi:/' -i leksaslia.md
    sed 's/pol:/puola:/' -i leksaslia.md
    sed 's/por:/portugali:/' -i leksaslia.md
    sed 's/rus:/venäjä:/' -i leksaslia.md
    sed 's/san:/sanskriitti:/' -i leksaslia.md
    sed 's/spa:/espanja:/' -i leksaslia.md
    sed 's/swa:/suahili:/' -i leksaslia.md
    sed 's/tam:/tamili:/' -i leksaslia.md
    sed 's/tel:/telugu:/' -i leksaslia.md
    sed 's/tgl:/filippiini:/' -i leksaslia.md
    sed 's/tha:/thai:/' -i leksaslia.md
    sed 's/tur:/turkki:/' -i leksaslia.md
    sed 's/urd:/urdu:/' -i leksaslia.md
    sed 's/vie:/vietnami:/' -i leksaslia.md
    sed 's/wol:/wolof:/' -i leksaslia.md
    sed 's/wuu:/wu-kiina:/' -i leksaslia.md
    sed 's/yor:/yoruba:/' -i leksaslia.md
    sed 's/yue:/kantoninkiina:/' -i leksaslia.md
    sed 's/zho:/yleiskiina:/' -i leksaslia.md
    sed 's/zul:/zulu:/' -i leksaslia.md
    cd ..
}

tarja_logaslia_pa_esperanti() {
    cd esperanti
    sed 's/amh:/amhara:/' -i leksaslia.md
    sed 's/ara:/araba:/' -i leksaslia.md
    sed 's/ben:/bengala:/' -i leksaslia.md
    sed 's/egy:/egipta araba:/' -i leksaslia.md
    sed 's/ell:/greka:/' -i leksaslia.md
    sed 's/eng:/angla:/' -i leksaslia.md
    sed 's/fas:/persa:/' -i leksaslia.md
    sed 's/fra:/franca:/' -i leksaslia.md
    sed 's/ful:/fula:/' -i leksaslia.md
    sed 's/guj:/guĝarata:/' -i leksaslia.md
    sed 's/hak:/hakaa:/' -i leksaslia.md
    sed 's/hau:/haŭsa:/' -i leksaslia.md
    sed 's/hin:/hindia:/' -i leksaslia.md
    sed 's/hun:/hungara:/' -i leksaslia.md
    sed 's/ibo:/igba:/' -i leksaslia.md
    sed 's/ita:/itala:/' -i leksaslia.md
    sed 's/jpn:/japana:/' -i leksaslia.md
    sed 's/kan:/kanara:/' -i leksaslia.md
    sed 's/khm:/kmera:/' -i leksaslia.md
    sed 's/kon:/konga:/' -i leksaslia.md
    sed 's/kor:/korea:/' -i leksaslia.md
    sed 's/lin:/lingala:/' -i leksaslia.md
    sed 's/ltn:/latina:/' -i leksaslia.md
    sed 's/mal:/malajala:/' -i leksaslia.md
    sed 's/mar:/maratha:/' -i leksaslia.md
    sed 's/may:/malaja:/' -i leksaslia.md
    sed 's/min:/mina:/' -i leksaslia.md
    sed 's/mya:/birma:/' -i leksaslia.md
    sed 's/orm:/oroma:/' -i leksaslia.md
    sed 's/pnb:/panĝaba:/' -i leksaslia.md
    sed 's/pol:/polona:/' -i leksaslia.md
    sed 's/por:/portugala:/' -i leksaslia.md
    sed 's/rus:/rusa:/' -i leksaslia.md
    sed 's/san:/sanskrita:/' -i leksaslia.md
    sed 's/spa:/hispana:/' -i leksaslia.md
    sed 's/swa:/svahila:/' -i leksaslia.md
    sed 's/tam:/tamila:/' -i leksaslia.md
    sed 's/tel:/teluga:/' -i leksaslia.md
    sed 's/tgl:/filipina:/' -i leksaslia.md
    sed 's/tha:/taja:/' -i leksaslia.md
    sed 's/tur:/turka:/' -i leksaslia.md
    sed 's/urd:/urdua:/' -i leksaslia.md
    sed 's/vie:/vjetnama:/' -i leksaslia.md
    sed 's/wol:/volofa:/' -i leksaslia.md
    sed 's/wuu:/vua:/' -i leksaslia.md
    sed 's/yor:/joruba:/' -i leksaslia.md
    sed 's/yue:/kantona:/' -i leksaslia.md
    sed 's/zho:/mandarena:/' -i leksaslia.md
    sed 's/zul:/zulua:/' -i leksaslia.md
    cd ..
}


#dos2unix pandunia-loge.csv
sed 's/\t/|/g' -i pandunia-loge.csv

# engli e pandunia
fata_liste 5 engli
tarja_logaslia_pa_engli

#Tiddly dictionary
cp engli/pandunia-engli.md temp/temp.txt
sed 's/_//g' -i temp/temp.txt
cat temp/tiddly_1.html temp/temp.txt temp/tiddly_3.html > engli/tiddly.html

# esperanti e pandunia
fata_liste 20 esperanti
tarja_logaslia_pa_esperanti

# suomi e pandunia
fata_liste 21 suomi
tarja_logaslia_pa_suomi

# polski e pandunia
fata_liste 22 polski

# Tiddly polski e pandunia
cp polski/pandunia-polski.md temp/temp.txt
sed 's/_//g' -i temp/temp.txt
cat temp/tiddly_1.html temp/temp.txt temp/tiddly_3.html > polski/tiddly.html

# cini e pandunia
fata_liste 11 cini

# rusi e pandunia
fata_liste 9 rusi

# fransi e pandunia
fata_liste 6 fransi

#Tiddly fransi e pandunia
cp fransi/pandunia-fransi.md temp/temp.txt
sed 's/_//g' -i temp/temp.txt
cat temp/tiddly_1.html temp/temp.txt temp/tiddly_3.html > fransi/tiddly.html

# espani e pandunia
fata_liste 7 espani

# portugali e pandunia
fata_liste 8 portugali

