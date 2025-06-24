#!/bin/bash

prepare() {
    lexoliste="temp/lexaslia.csv"
    cat ../panlexia/dict/P/pandunia.tsv | awk -F "\t" "{print \$3\",\"\$5}" | sort -f > $lexoliste
    #mortife duime line
    sed -i '2d' $lexoliste
    #mortife la hali line –– kon 'whitespace'!
    sed '/,[[:space:]]*$/d' -i $lexoliste
    #mute ', ' a ','
    sed -i 's/ + /,/' $lexoliste
    sed -i 's/, /,/' $lexoliste
    sed -i 's/• //' $lexoliste
}

echo poze la lexe a dunia karte
prepare
python3 bin/fate_lexokarte.py

