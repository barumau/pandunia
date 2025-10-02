#!/bin/bash

install_MKDocs() {
    # First install Python and Pip
    # sudo apt install python3
    # sudo apt install python3-pip
    apt install pipx
    # For website generation
    pipx install mkdocs
    pipx install mkdocs-material --include-deps
}

install_PanDoc() {
    # For PDF generation
    sudo apt install pandoc
    sudo apt install pdflatex
    sudo apt-get install texlive-latex-base
    sudo apt-get install texlive-fonts-recommended
    sudo apt-get install texlive-fonts-extra
    sudo apt-get install texlive-latex-extra
    sudo apt-get install texlive-xetex
}

intall_Panlexia() {
    # For dictionary generation.
    sudo apt install tree
    git clone https://github.com/barumau/panlexia.git ~/panlexia
 }

#Uncomment the function calls that you want to run to install tools.
#install_MKDocs
#install_PanDoc
#intall_Panlexia