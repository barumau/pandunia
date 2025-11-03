kopi_lexe_lista() {
    pandunia_x="../panlexia/generated/pandunia-$1.md"
    x_pandunia="../panlexia/generated/$1-pandunia.md"
    cp $pandunia_x $1
    cp $x_pandunia $1
}

kopi_lexe_liste_kon_altre_nim() {
    pandunia_x="../panlexia/generated/pandunia-$1.md"
    x_pandunia="../panlexia/generated/$1-pandunia.md"
    cp $pandunia_x $2
    cp $x_pandunia $2
}

kopi_data_do_lexia() {
    cp ../panlexia/generated/arb-pandunia.csv ./html/lexia/data
    cp ../panlexia/generated/cmn-pandunia.csv ./html/lexia/data
    cp ../panlexia/generated/deu-pandunia.csv ./html/lexia/data
    cp ../panlexia/generated/eng-pandunia.csv ./html/lexia/data
    cp ../panlexia/generated/epo-pandunia.csv ./html/lexia/data
    cp ../panlexia/generated/fas-pandunia.csv ./html/lexia/data
    cp ../panlexia/generated/fin-pandunia.csv ./html/lexia/data
    cp ../panlexia/generated/fra-pandunia.csv ./html/lexia/data
    cp ../panlexia/generated/jpn-pandunia.csv ./html/lexia/data
    cp ../panlexia/generated/por-pandunia.csv ./html/lexia/data
    cp ../panlexia/generated/pol-pandunia.csv ./html/lexia/data
    cp ../panlexia/generated/rus-pandunia.csv ./html/lexia/data
    cp ../panlexia/generated/spa-pandunia.csv ./html/lexia/data
    cp ../panlexia/generated/tha-pandunia.csv ./html/lexia/data
}

krea_lexaslik_lista() {
    #pandunia = $3 e lexasle = $5
    cat ../panlexia/dict/P/pandunia.tsv | awk -F '\t' "{print \"**\" \$3 \"** ≈ \" \$5  \"\"}" > $1/lexaslia.md
    dos2unix $1/lexaslia.md
    #mata 1:me line
    sed -i '1d' $1/lexaslia.md
    #Sort
    LC_ALL=C sort -f $1/lexaslia.md --output $1/lexaslia.md
    #Delete empty translations
    sed -i '/≈ $/d' $1/lexaslia.md
    #repare 2:me line
    #sed 's/|\*\*--/|--/' -i $2/lexaslia.md
    #sed 's/--\*\*|/--|/' -i $2/lexaslia.md
    #awk 'BEGIN {OFS=""} {if ($0 ~ /\*\*/) print $0,"  ";else print $0}' $1/lexaslia.md
    #sed 's/\^\*\*\S*$/&_  /g' -i $1/lexaslia.md
    #Add Markdown style line break (two spaces) to every line.
    sed "s/$/  /" -i $1/lexaslia.md
    #Add header
    sed -i "1s/^/# lexaslia\n\n/" $1/lexaslia.md
}

krea_lexe_lista() {
    echo krea lexeliste pa $1
    kopi_lexe_lista $1
    krea_lexaslik_lista $1
}

fata_lexi_asal() {
    #pandunia = $2 i lexi asal = $5
    cat ../panlexia/lexia.csv | awk -F "|" "{print \"|**\" \$2 \"**|\" \$6 \"|\"}" > temp/lexi.txt
    #mata 1:me line
    sed -i '1d' temp/lexi.txt
    sed -i '1d' temp/lexi.txt
    cat pandunia/loge_asle_supre.md temp/lexi.txt > pandunia/lexaslia.md
    #Delete empty translations
    sed -i '/||/d' pandunia/lexaslia.md
}

trabashe_lexaslia_do_engle() {
    cd eng
    sed 's/amh:/Amharic:/' -i lexaslia.md
    sed 's/ara:/Arabic:/' -i lexaslia.md
    sed 's/ben:/Bengali:/' -i lexaslia.md
    sed 's/egy:/Egyptian-Arabic:/' -i lexaslia.md
    sed 's/ell:/Greek:/' -i lexaslia.md
    sed 's/eng:/English:/' -i lexaslia.md
    sed 's/fas:/Persian:/' -i lexaslia.md
    sed 's/fra:/French:/' -i lexaslia.md
    sed 's/ful:/Fulani:/' -i lexaslia.md
    sed 's/guj:/Gujarati:/' -i lexaslia.md
    sed 's/hak:/Hakka-Chinese:/' -i lexaslia.md
    sed 's/hau:/Hausa:/' -i lexaslia.md
    sed 's/hin:/Hindi:/' -i lexaslia.md
    sed 's/hun:/Hungarian:/' -i lexaslia.md
    sed 's/ibo:/Igbo:/' -i lexaslia.md
    sed 's/ita:/Italian:/' -i lexaslia.md
    sed 's/jpn:/Japanese:/' -i lexaslia.md
    sed 's/kan:/Kannada:/' -i lexaslia.md
    sed 's/khm:/Khmer:/' -i lexaslia.md
    sed 's/kon:/Kongo:/' -i lexaslia.md
    sed 's/kor:/Korean:/' -i lexaslia.md
    sed 's/lin:/Lingala:/' -i lexaslia.md
    sed 's/ltn:/Latin:/' -i lexaslia.md
    sed 's/mal:/Malayalam:/' -i lexaslia.md
    sed 's/mar:/Marathi:/' -i lexaslia.md
    sed 's/may:/Malay:/' -i lexaslia.md
    sed 's/min:/Min-Chinese:/' -i lexaslia.md
    sed 's/mya:/Burmese:/' -i lexaslia.md
    sed 's/orm:/Oromo:/' -i lexaslia.md
    sed 's/pnb:/Punjabi:/' -i lexaslia.md
    sed 's/pol:/Polish:/' -i lexaslia.md
    sed 's/por:/Portuguese:/' -i lexaslia.md
    sed 's/rus:/Russian:/' -i lexaslia.md
    sed 's/san:/Sanskrit:/' -i lexaslia.md
    sed 's/spa:/Spanish:/' -i lexaslia.md
    sed 's/swa:/Swahili:/' -i lexaslia.md
    sed 's/tam:/Tamil:/' -i lexaslia.md
    sed 's/tel:/Telugu:/' -i lexaslia.md
    sed 's/tgl:/Filipino:/' -i lexaslia.md
    sed 's/tha:/Thai:/' -i lexaslia.md
    sed 's/tur:/Turkish:/' -i lexaslia.md
    sed 's/urd:/Urdu:/' -i lexaslia.md
    sed 's/vie:/Vietnamese:/' -i lexaslia.md
    sed 's/wol:/Wolof:/' -i lexaslia.md
    sed 's/wuu:/Wu-Chinese:/' -i lexaslia.md
    sed 's/yor:/Yoruba:/' -i lexaslia.md
    sed 's/yue:/Cantonese:/' -i lexaslia.md
    sed 's/zho:/Mandarin:/' -i lexaslia.md
    sed 's/zul:/Zulu:/' -i lexaslia.md
    cd ..
}

trabashe_lexaslia_do_suome() {
    cd fin
    sed 's/amh:/amhara:/' -i lexaslia.md
    sed 's/ara:/arabia:/' -i lexaslia.md
    sed 's/ben:/bangla:/' -i lexaslia.md
    sed 's/egy:/egyptinarabia:/' -i lexaslia.md
    sed 's/ell:/kreikka:/' -i lexaslia.md
    sed 's/eng:/englanti:/' -i lexaslia.md
    sed 's/fas:/persia:/' -i lexaslia.md
    sed 's/fra:/ranska:/' -i lexaslia.md
    sed 's/ful:/fulani:/' -i lexaslia.md
    sed 's/guj:/gujarati:/' -i lexaslia.md
    sed 's/hak:/hakkakiina:/' -i lexaslia.md
    sed 's/hau:/hausa:/' -i lexaslia.md
    sed 's/hin:/hindi:/' -i lexaslia.md
    sed 's/hun:/unkari:/' -i lexaslia.md
    sed 's/ibo:/igbo:/' -i lexaslia.md
    sed 's/ita:/italia:/' -i lexaslia.md
    sed 's/jpn:/japani:/' -i lexaslia.md
    sed 's/kan:/kannada:/' -i lexaslia.md
    sed 's/khm:/khmer:/' -i lexaslia.md
    sed 's/kon:/Kongo:/' -i lexaslia.md
    sed 's/kor:/korea:/' -i lexaslia.md
    sed 's/lin:/lingala:/' -i lexaslia.md
    sed 's/ltn:/latina:/' -i lexaslia.md
    sed 's/mal:/malayalam:/' -i lexaslia.md
    sed 's/mar:/marathi:/' -i lexaslia.md
    sed 's/may:/malaiji:/' -i lexaslia.md
    sed 's/min:/min-kiina:/' -i lexaslia.md
    sed 's/mya:/burma:/' -i lexaslia.md
    sed 's/orm:/oromo:/' -i lexaslia.md
    sed 's/pnb:/pandzabi:/' -i lexaslia.md
    sed 's/pol:/puola:/' -i lexaslia.md
    sed 's/por:/portugali:/' -i lexaslia.md
    sed 's/rus:/venäjä:/' -i lexaslia.md
    sed 's/san:/sanskriitti:/' -i lexaslia.md
    sed 's/spa:/espanja:/' -i lexaslia.md
    sed 's/swa:/suahili:/' -i lexaslia.md
    sed 's/tam:/tamili:/' -i lexaslia.md
    sed 's/tel:/telugu:/' -i lexaslia.md
    sed 's/tgl:/filippiini:/' -i lexaslia.md
    sed 's/tha:/thai:/' -i lexaslia.md
    sed 's/tur:/turkki:/' -i lexaslia.md
    sed 's/urd:/urdu:/' -i lexaslia.md
    sed 's/vie:/vietnami:/' -i lexaslia.md
    sed 's/wol:/wolof:/' -i lexaslia.md
    sed 's/wuu:/wu-kiina:/' -i lexaslia.md
    sed 's/yor:/yoruba:/' -i lexaslia.md
    sed 's/yue:/kantoninkiina:/' -i lexaslia.md
    sed 's/zho:/yleiskiina:/' -i lexaslia.md
    sed 's/zul:/zulu:/' -i lexaslia.md
    cd ..
}

trabashe_lexaslia_do_esperante() {
    cd epo
    sed 's/amh:/amhara:/' -i lexaslia.md
    sed 's/ara:/araba:/' -i lexaslia.md
    sed 's/ben:/bengala:/' -i lexaslia.md
    sed 's/egy:/egipta araba:/' -i lexaslia.md
    sed 's/ell:/greka:/' -i lexaslia.md
    sed 's/eng:/angla:/' -i lexaslia.md
    sed 's/fas:/persa:/' -i lexaslia.md
    sed 's/fra:/franca:/' -i lexaslia.md
    sed 's/ful:/fula:/' -i lexaslia.md
    sed 's/guj:/guĝarata:/' -i lexaslia.md
    sed 's/hak:/hakaa:/' -i lexaslia.md
    sed 's/hau:/haŭsa:/' -i lexaslia.md
    sed 's/hin:/hindia:/' -i lexaslia.md
    sed 's/hun:/hungara:/' -i lexaslia.md
    sed 's/ibo:/igba:/' -i lexaslia.md
    sed 's/ita:/itala:/' -i lexaslia.md
    sed 's/jpn:/japana:/' -i lexaslia.md
    sed 's/kan:/kanara:/' -i lexaslia.md
    sed 's/khm:/kmera:/' -i lexaslia.md
    sed 's/kon:/konga:/' -i lexaslia.md
    sed 's/kor:/korea:/' -i lexaslia.md
    sed 's/lin:/lingala:/' -i lexaslia.md
    sed 's/ltn:/latina:/' -i lexaslia.md
    sed 's/mal:/malajala:/' -i lexaslia.md
    sed 's/mar:/maratha:/' -i lexaslia.md
    sed 's/may:/malaja:/' -i lexaslia.md
    sed 's/min:/mina:/' -i lexaslia.md
    sed 's/mya:/birma:/' -i lexaslia.md
    sed 's/orm:/oroma:/' -i lexaslia.md
    sed 's/pnb:/panĝaba:/' -i lexaslia.md
    sed 's/pol:/polona:/' -i lexaslia.md
    sed 's/por:/portugala:/' -i lexaslia.md
    sed 's/rus:/rusa:/' -i lexaslia.md
    sed 's/san:/sanskrita:/' -i lexaslia.md
    sed 's/spa:/hispana:/' -i lexaslia.md
    sed 's/swa:/svahila:/' -i lexaslia.md
    sed 's/tam:/tamila:/' -i lexaslia.md
    sed 's/tel:/teluga:/' -i lexaslia.md
    sed 's/tgl:/filipina:/' -i lexaslia.md
    sed 's/tha:/taja:/' -i lexaslia.md
    sed 's/tur:/turka:/' -i lexaslia.md
    sed 's/urd:/urdua:/' -i lexaslia.md
    sed 's/vie:/vjetnama:/' -i lexaslia.md
    sed 's/wol:/volofa:/' -i lexaslia.md
    sed 's/wuu:/vua:/' -i lexaslia.md
    sed 's/yor:/joruba:/' -i lexaslia.md
    sed 's/yue:/kantona:/' -i lexaslia.md
    sed 's/zho:/mandarena:/' -i lexaslia.md
    sed 's/zul:/zulua:/' -i lexaslia.md
    cd ..
}

# gene dubashik lexe lista
cd ../panlexia
rm generated/*
mkdir generated
sh tools/generate_bilingual_dictionaries.sh pandunia
cd ../pandunia

# english e pandunia
krea_lexe_lista eng
trabashe_lexaslia_do_engle

# esperanto e pandunia
krea_lexe_lista epo

# suome e pandunia
krea_lexe_lista fin
#trabashe_lexaslia_do_suome

# polski e pandunia
krea_lexe_lista pol

# putonghan e pandunia
kopi_lexe_liste_kon_altre_nim cmn zho

# nipon e pandunia
krea_lexe_lista jpn

# malayu e pandunia
kopi_lexe_liste_kon_altre_nim ind may

# rus e pandunia
krea_lexe_lista rus

# franse e pandunia
krea_lexe_lista fra

# espanya e pandunia
krea_lexe_lista spa

# portugal e pandunia
krea_lexe_lista por

# lexi asal a pandunia baxa
krea_lexaslik_lista pandunia

kopi_data_do_lexia
