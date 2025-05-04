fa_pandoc() {
    pandoc --lua-filter=bin/parse-html.lua --from=markdown-markdown_in_html_blocks $1/pan.md -V geometry:a4paper,margin=2cm -s -o $1/pan.pdf --pdf-engine=/usr/bin/xelatex -V mainfont="$2" -V monofont="DejaVu Sans Mono"
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
    max_dataje_nam $1/I01_ration.md
    max_dataje_nam $1/100_baze_kanun.md
    max_dataje_nam $1/G-ABC.md
    max_dataje_nam $1/G-PoS.md
    max_dataje_nam $1/G-N.md
    max_dataje_nam $1/G-ADJ.md
    max_dataje_nam $1/G-NUM.md
    max_dataje_nam $1/G-PRO.md
    max_dataje_nam $1/G-V.md
    max_dataje_nam $1/G-PP.md
    max_dataje_nam $1/G-P.md
    max_dataje_nam $1/G-AFX.md
    max_dataje_nam $1/K00_kurse.md
}

fa_pan_md() {
    echo
    echo "kitab da $1 PDF dokumen"
    rm temp/dataje_liste.txt
    touch temp/dataje_liste.txt
    fa_dataje_liste $1
    cat temp/dataje_liste.txt | xargs -d "\n" cat -- > $1/pan.md

    #da subik kitab have 'unicode' harfe e simbol, dat 'pandoc' no kan kitab.
    #101_dunia_loga.md 200_baze_jumla.md

    # uze da lok of grafe
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
