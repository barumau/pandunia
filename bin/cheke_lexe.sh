#!/bin/bash
# List Pandunia words that are used in the documentation,
# and print those out that are not found in the official vocabulary.

cheke_folde() {
    # Select out text lines in the target language.
    # They are in cursive and/or bold font, so the lines always begin with `*`.
    grep "^\*" $1 -r > temp/pan_lexe.txt
    # Delete irrelevant lines.
    sed "/lexaslia\.md/d" -i temp/pan_lexe.txt
    sed "/pandunia-$1\.md/d" -i temp/pan_lexe.txt
    sed "/$1-pandunia\.md/d" -i temp/pan_lexe.txt
    sed "/pan\.md/d" -i temp/pan_lexe.txt
    sed "/Binary file.*matches/d" -i temp/pan_lexe.txt
    # Delete special symbols
    sed "s/[,!?=–~ᴬᴾ\*\`\"\']//g" -i temp/pan_lexe.txt
    # Check the words against the official vocabulary with Python.
    python3 bin/cheke_lexe.py
    rm temp/pan_lexe.txt
}

# Check language-specific folders one by one.
cheke_folde eng
cheke_folde epo
cheke_folde fin
cheke_folde fra
cheke_folde ita
cheke_folde jpn
cheke_folde may
cheke_folde pol
cheke_folde por
cheke_folde rus
cheke_folde spa
cheke_folde tha
cheke_folde zho
