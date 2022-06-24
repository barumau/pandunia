fa_pandoc() {
    pandoc $1/pan.md -s -o $1/pan.pdf --pdf-engine=/usr/bin/xelatex -V mainfont="DejaVu Serif" -V monofont="DejaVu Sans Mono" -V CJKmainfont="Noto Sans CJK SC" -V devanagarifont="Noto Sans Devanagari"
    sed 's/\/home\/risto\/pandunia\/html/http:\/\/www.pandunia.info/g' -i $1/pan.md
}

fa_pan_md() {
    echo
    echo "kitabe la $1 PDF dokomen"
    cd $1
    cat 000_dake.md 100_baze_kanun.md 102_ABC.md 103_lexotipe.md 104_viselexe.md 105_namolexe.md 106_nume.md 107_modolexe.md 108_karmaloga.md 109_jumlobine.md 110_lexobine.md 201_xule.md > pan.md

    #la sube kitabe ave 'unicode' harfe e simbol, jo 'pandoc' no bil kitabe.
    #101_dunia_loga.md 200_baze_jumla.md

    # uze la loke di grafe
    sed 's/http:\/\/www.pandunia.info/\/home\/risto\/pandunia\/html/g' -i pan.md
    cd ..
}

fa_pan_md english
fa_pandoc english
fa_pan_md espanya
fa_pandoc espanya

# uze la pake:
#sudo apt install pandoc
#sudo apt install pdflatex
#sudo apt-get install texlive-latex-base
#sudo apt-get install texlive-fonts-recommended
#sudo apt-get install texlive-fonts-extra
#sudo apt-get install texlive-latex-extra
#sudo apt-get install texlive-xetex

