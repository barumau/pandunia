fa_pandoc() {
    pandoc $1/pan.md -V geometry:a4paper,margin=2cm -s -o $1/pan.pdf --pdf-engine=/usr/bin/xelatex -V mainfont="$2" -V monofont="DejaVu Sans Mono"
    #-V CJKmainfont="MS Mincho" #-V CJKmainfont="Noto Sans CJK SC" -V devanagarifont="Noto Sans Devanagari"
    sed 's/\/home\/rkupsala\/pandunia\/html/http:\/\/www.pandunia.info/g' -i $1/pan.md
}

max_dataje_nam() {
    if test -f "$1"; then
        echo "zai $1"
        echo $1 >> temp/dataje_liste.txt
    #else
        #echo "no zai $1"
    fi
}

fa_dataje_liste() {
    max_dataje_nam $1/000_dake.md
    max_dataje_nam $1/001_ration.md
    max_dataje_nam $1/100_baze_kanun.md
    max_dataje_nam $1/102_ABC.md
    max_dataje_nam $1/103_lexitipe.md
    max_dataje_nam $1/104_viselexi.md
    max_dataje_nam $1/105_namlexi.md
    max_dataje_nam $1/106_nume.md
    max_dataje_nam $1/107_modelexi.md
    max_dataje_nam $1/108_karlexi.md
    max_dataje_nam $1/109_jumlabina.md
    max_dataje_nam $1/110_lexibina.md
    max_dataje_nam $1/201_xula.md
}

fa_pan_md() {
    echo
    echo "kitaba la $1 PDF dokumen"
    rm temp/dataje_liste.txt
    touch temp/dataje_liste.txt
    fa_dataje_liste $1
    cat temp/dataje_liste.txt | xargs -d "\n" cat -- > $1/pan.md

    #la sube kitaba ha 'unicode' harfe e simbol, ki 'pandoc' no bil kitaba.
    #101_dunia_loga.md 200_baze_jumla.md

    # uze la loka di grafe
    #sed 's/http:\/\/www.pandunia.info/\/home\/risto\/pandunia\/html/g' -i $1/pan.md
    sed 's/http:\/\/www.pandunia.info/\/home\/rkupsala\/pandunia\/html/g' -i $1/pan.md
}

kitabe_europan_dokume() {
    fa_pan_md $1
    #fa_pandoc $1 "DejaVu Serif"
    fa_pandoc $1 "FreeSerif"
}

kitabe_nipon_dokume() {
    fa_pan_md $1
    fa_pandoc $1 "Noto Serif CJK JP"
}

kitabe_china_dokume() {
    fa_pan_md $1
    fa_pandoc $1 "Noto Serif CJK SC"
}

kitabe_europan_dokume eng
kitabe_europan_dokume epo
kitabe_europan_dokume fra
kitabe_europan_dokume ita
kitabe_europan_dokume pol
kitabe_europan_dokume rus
kitabe_europan_dokume spa
kitabe_europan_dokume suomi

kitabe_nipon_dokume jpn

kitabe_china_dokume zho

# uze ye pake:
#sudo apt install pandoc
#sudo apt install pdflatex
#sudo apt-get install texlive-latex-base
#sudo apt-get install texlive-fonts-recommended
#sudo apt-get install texlive-fonts-extra
#sudo apt-get install texlive-latex-extra
#sudo apt-get install texlive-xetex
