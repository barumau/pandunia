fa_pandoc() {
    pandoc $1/pan.md -s -o $1/pan.pdf --pdf-engine=/usr/bin/xelatex -V mainfont="DejaVu Serif" -V monofont="DejaVu Sans Mono" #-V CJKmainfont="Noto Sans CJK SC" -V devanagarifont="Noto Sans Devanagari"
    sed 's/\/home\/rkupsala\/pandunia\/html/http:\/\/www.pandunia.info/g' -i $1/pan.md
}

fa_pan_md() {
    echo
    echo "kitaba la $1 PDF dokumen"
    cd $1
    cat 000_dake.md 100_baze_kanun.md 102_ABC.md 103_lexitipe.md 104_viselexi.md 105_namlexi.md 106_nume.md 107_modelexi.md 108_karelexi.md 109_jumlabina.md 110_lexibina.md 201_xula.md > pan.md

    #la sube kitaba ha 'unicode' harfe e simbol, ki 'pandoc' no bil kitaba.
    #101_dunia_loga.md 200_baze_jumla.md

    # uze la loka di grafe
    sed 's/http:\/\/www.pandunia.info/\/home\/rkupsala\/pandunia\/html/g' -i pan.md
    cd ..
}

fa_pan_md eng
fa_pandoc eng
fa_pan_md spa
fa_pandoc spa

# uze la pake:
#sudo apt install pandoc
#sudo apt-get install texlive-xetex
