#!/bin/bash

install_MKDocs() {
    # First install Python and Pip
    # sudo apt install python3
    # sudo apt install python3-pip

    # Create a folder for all virtual environments for Python.
    mkdir -p $HOME/.venvs
    # Create my environment called "pan".
    python3 -m venv $HOME/.venvs/pan
    # Install Python libraries for website generation.
    $HOME/.venvs/pan/bin/python -m pip install mkdocs
    $HOME/.venvs/pan/bin/python -m pip install mkdocs-material #--include-deps
    # Install Python libary for data manipulation.
    $HOME/.venvs/pan/bin/python -m pip install pandas
    # Activate the virtual environment.
    # Do this always when you want to use mkdocs!
    source $HOME/.venvs/pan/bin/activate
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