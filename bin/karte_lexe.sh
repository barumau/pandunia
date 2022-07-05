#!/bin/bash

prepare() {
   lexoliste="temp/lexaslia.csv"
   cat pandunia-loge.csv | awk -F "|" "{print \$2\",\"\$5}" > $lexoliste
    #mortife duime line
    sed -i '2d' $lexoliste
    #mortife la hali line
    sed -i '/,$/d' $lexoliste
    #mute ', ' a ','
    sed -i 's/ + /,/' $lexoliste
    sed -i 's/, /,/' $lexoliste
    sed -i 's/• //' $lexoliste
}

prepare
python3 bin/fate_lexokarte.py

