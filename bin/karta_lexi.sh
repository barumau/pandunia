#!/bin/bash

prepare() {
    lexoliste="temp/lexaslia.csv"
    tail +2 ../panlexia/dict/P/pandunia.tsv | awk -F "\t" "{print \$3\"|\"\$1\"|\"\$5}" | sort -f > $lexoliste
    #mortife la hali line –– kon 'whitespace'!
    sed '/||/d' -i $lexoliste
    sed '/|[[:space:]]*$/d' -i $lexoliste
    #mute ', ' a ','
    sed -i 's/ + /,/' $lexoliste
    sed -i 's/, /,/' $lexoliste
    sed -i 's/• //' $lexoliste
}

echo poza lexe pa dunia-karte
prepare
python3 bin/fate_lexokarte.py

