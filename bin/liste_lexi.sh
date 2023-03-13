fata_lista_pandunia_X() {
    lexilista="$2/pandunia-$2.md"
    #echo "kitaba $lexilista"
    #pandunia ($2) a 1:me
    cat lexi.csv | awk -F "|" "{print \$2	 \" - \" \$$1 \"  \"}" > $lexilista
    #mata 1:me line
    sed -i '1d' $lexilista
    # ABC nam to title a line xure
    sed -i 's/^[A-Z] - .*$/\n##&\n/' $lexilista
    # mute "A - A" to "A"
    sed 's/#[A-Z] -/#/g' -i $lexilista
    #Delete empty translations
    sed -i '/-...$/d' $lexilista
	
	kitaba_Tiddly $2
	
    #kitaba la name i la preloge
    headername="$2/pandunia-$2.preloge.txt"
    if test -f "$headername"; then
       echo "$headername exists"
       cat $headername $lexilista > temp/temp.txt
       mv temp/temp.txt $lexilista
    else
       echo "$headername doesn't exist. Writing default heading."
       sed -i "1s/^/# pandunia–$3\n/" $lexilista
    fi
}

fata_lista_X_pandunia() {
    #ale lingue a 1:me
    lexilista="$2/$2-pandunia.md"
    #echo "kitaba $lexilista"
    cat lexi.csv | awk -F "|" "{print \$$1 \" - \" \$2 \"  \"}" > $lexilista
    #mata 1:me line
    sed -i '1d' $lexilista
    # alfabeta
    cat $2/$2-pandunia.md | LC_ALL=C sort -f > temp/temp.txt
    # ABC nam to title a line xure
    cat temp/temp.txt | sed 's/^[A-Z] - .*$/\n##&\n/' > $lexilista
    # mute "A - A" to "A"
    sed 's/#[A-Z] -/#/g' -i $lexilista
    #Add header
    sed -i "1s/^/# $3–pandunia\n/" $lexilista
    #Delete empty translations
    sed -i '/^.-/d' $lexilista
    #Delete bullets
    sed 's/• //g' -i $lexilista
}

fa_lexi_asal_lista() {
    #pandunia = $2 i lexi asal = $5
#    cat lexi.csv | awk -F "|" "{print \$$1 \$1 \$4 }" > $2/leksaslia.md
    cat lexi.csv | awk -F "|" "{print \"**\" \$2 \"** *\" \$$1 \"* ← \" \$5 \"  \"}" > $2/leksaslia.md
    #mata 1:me line
    sed -i '1d' $2/leksaslia.md
    #Sort
    LC_ALL=C sort -f $2/leksaslia.md --output $2/leksaslia.md
    #Add header
    sed -i "1s/^/# pandunia–$2 va lexaslia\n/" $2/leksaslia.md
    #Delete empty translations
    sed -i '/←   /d' $2/leksaslia.md
    sed -i '/----/d' $2/leksaslia.md
    #repare 2:me line
    #sed 's/|\*\*--/|--/' -i $2/leksaslia.md
    #sed 's/--\*\*|/--|/' -i $2/leksaslia.md
}

fata_lista() {
    echo kitaba lexilista de $2
    fata_lista_pandunia_X $1 $2 $3
    fata_lista_X_pandunia $1 $2 $3
    fa_lexi_asal_lista $1 $2
}

fata_lexi_asal() {
    #pandunia = $2 i lexi asal = $5
    cat lexi.csv | awk -F "|" "{print \"|**\" \$2 \"**|\" \$5 \"|\"}" > temp/lexi.txt
    #mata 1:me line
    sed -i '1d' temp/lexi.txt
    sed -i '1d' temp/lexi.txt
    cat pandunia/loge_asle_supre.md temp/lexi.txt > pandunia/leksaslia.md
    #Delete empty translations
    sed -i '/||/d' pandunia/leksaslia.md
}


kitaba_Tiddly() {
    cp $1/pandunia-$1.md temp/temp.txt
    sed 's/_//g' -i temp/temp.txt
    #mata 1:me line
    sed -i '1d' temp/temp.txt
    cat temp/tiddly_1.html temp/temp.txt temp/tiddly_3.html > $1/tiddly.html
}

trabaxa_lexi_asal_to_english() {
    cd eng
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

trabaxa_lexi_asal_to_suomi() {
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

trabaxa_lexi_asal_to_esperanto() {
    cd epo
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


#dos2unix lexi.csv
sed 's/\t/|/g' -i lexi.csv

# english i pandunia
fata_lista 6 eng English
trabaxa_lexi_asal_to_english

#Tiddly dictionary
#kitaba_Tiddly eng

# esperanto i pandunia
fata_lista 26 epo esperanto
trabaxa_lexi_asal_to_esperanto

# suomi i pandunia
fata_lista 27 suomi suomi
trabaxa_lexi_asal_to_suomi

# polski i pandunia
fata_lista 28 pol polski

# Tiddly polski i pandunia
#kitaba_Tiddly pol

# putonghan i pandunia
fata_lista 21 zho "putong han"

# nipon i pandunia
fata_lista 23 jpn nipon

# malayu i pandunia
fata_lista 16 may "bahasa malayu"

# rus i pandunia
fata_lista 11 rus русский

# franse i pandunia
fata_lista 8 fra français

#Tiddly franse i pandunia
kitaba_Tiddly fra

# espanya i pandunia
fata_lista 9 spa español

# portugal i pandunia
fata_lista 10 por português

# lexi asal a pandunia baxa
fata_lexi_asal

