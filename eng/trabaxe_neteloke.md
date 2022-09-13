# How to translate this site

## Introduction

The Pandunia website is created from plain text files that you can edit yourself.
All that you need is:

1. the source text package
2. a text editor


## The simple way

Follow these instructions if you don't know (and don't want to know) anything about file version management.

1. Go to the Pandunia repository in GitHub at [https://github.com/barumau/pandunia](https://github.com/barumau/pandunia).
2. To download the files, click *Code* and *Download ZIP*.
3. Extract the ZIP file.
4. Edit the files with a **text editor** like Notepad or
   [Ghostwriter](https://wereturtle.github.io/ghostwriter/).
   Don't use a **word processor** like MS Word!
5. Send the files by email to risto@pandunia.info
   and he will take care of the rest.

If you want to edit some file later, start again from step 1
because someone else could have edited the same file after you.
(You can also check it from the [change history](https://github.com/barumau/pandunia/commits/master)).


## The programmer's way

Use a Linux system, such as Ubuntu, Fedora or Windows Subsystem for Linux (WSL).
(See [how to install Ubuntu](https://ubuntu.com/wsl) for Windows 10 or 11.)

Install MkDocs by following [the instructions here](https://www.mkdocs.org/user-guide/installation/)
or just type these commands.

```
# Check do you have Python (python3) and Python package manager (pip) already istalled.
python3 --version
pip --version
# Install them if you don't have them already.
sudo apt install python3
sudo apt install python3-pip
# Install MkDocs
pip install mkdocs
# Install Material theme
pip install mkdocs-material
```

Clone the Pandunia repository from GitHub.

```
git clone https://github.com/barumau/pandunia.git
```

Go to the *pandunia* directory and build everything (dictionaries and HTML documents).
The output goes to *html* directory.

```
cd pandunia
sh bin/pan.sh
```

Learn how to make change requests ("pull requests") by reading [GitHub guides](https://guides.github.com/).
Here are some basic commands for your information:

```
# Updates all files from the repository to your machine
git pull
# Creates a branch for your changes
git checkout -b branch_for_my_edits
# Saves your changes to the local version control system
git commit file1 file2 -m "Description of my changes"
# Uploads your branch to GitHub
git push origin branch_for_my_edits
# Gets you back to the main branch
git checkout master
```

## Writing in Markdown syntax

Contents of Pandunia website is written in plain-text using the Markdown format. Markdown is a light-weight and easy-to-use syntax that is perfectly readable in plain-text. Read description of the Markdown syntax [here](https://guides.github.com/features/mastering-markdown/) or [here](https://daringfireball.net/projects/markdown/syntax).


## Dictionary

The original dictionary is a file called
[pandunia-loge.csv](https://github.com/barumau/pandunia/blob/master/pandunia-loge.csv).
It is in character-separated format (CSV) and cells are separated with the vertical bar "|".
It includes translations from Pandunia to English and many other languages.
All dictionaries in different languages are created from this file.

You can edit the file in Microsoft Excel, LibreOffice Calc, other spreadsheet tools and text editors.


## Translating

### Source language

English version is the original version of the site.
Translate to your language from the English version if possible!
Otherwise use another language version that is up-to-date and complete.

### What to translate first?

When you begin translating for a new language, start from these files.

- index.md
    - This page should include a short introduction to Pandunia.
    - Include here links only to pages that are existing and/or ready.
    - If the site is incomplete, ask the reader to go to a more complete language version (like English)
- mkdocs/english/mkdocs.yml
    - This is the side menu of the website
    - Include here links only to pages that are existing and/or ready.
- 100_baze_kanun.md
    - This page includes the ten basic rules of Pandunia in a concise list
- 102_ABC.md
    - This page explains how to write and speak Pandunia
- 200_baze_jumla.md
    - This page introduces basic words, sentences and grammatical structures

### Translating entire documents

1. Copy the source file to the folder of the new language
    - Please don't change the file names!
      Names are in Pandunia so that contents of different language versions can be compared more easily.
2. Translate text
3. If translation is incomplete in the end
    - Delete untranslated text
    - or hide it between < ! - - and - - > (without spaces) so that it won't be visible in the web site

### Updating translations

The best way to update translations and to translate parts of documents is to use a program that compares two files side by side.
A good tool for this is BeyondCompare.

Pandunia words and sentences should be the same in both language versions,
so they function as anchor points that keep the versions in the same line.

![](http://www.pandunia.info/grafe/kompar.png "Comparing two language versions")

### Tips

* Use simple and concise language!
    * Readers can be all ages and they can have any level of education.
    * Some languages can be read by non-native speakers too.
* Use original examples in Pandunia.
  This way it is easy to compare different language versions with each other.
* Use fluent language!
    * If something sounds bad in when it is translated to your language from English, feel free to use a better wording!
* You can improve also the source text.
    * The source text is not perfect.
      There can be unclear things, bad style and even mistakes.
    * Feel free to propose new chapters and lessons
