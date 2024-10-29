"""Reorder Pandunia morphemes into <prefix.stem·suffix'ending> format.

This program reorders Pandunia words' morphological notation from the old format to the new format.
Input:  dut!pro!para.ion.al.ism:e
Output: para.pro.dut·ion·al·ism'e

CC-BY 2024 Risto Kupsala (https://github.com/barumau)
"""
import helpers

def reorder_morphemes(word):
    """Reorders for example <dut!pro!para.ion.al.ism:e> into <para.pro.dut·ion·al·ism'e>. """
    morphemes = word.replace("!", ",!").replace(".t.", ".t").replace(".", ",·").replace(":", ",'").split(',')
    reordered = ""
    for morpheme in morphemes:
        if "!" in morpheme:
            # The old way was to mark prefixes with prefixed <!>.
            # Insert prefix before the rest and mark it with suffixed <.>.
            reordered = morpheme.replace("!", "") + "." + reordered
        else:
            # Insert suffixes and endings after the rest.
            # Prefix suffixes with <·> and the ending with <'>.
            reordered = reordered + morpheme
    
    if word != "" and reordered[-1] == "·":
        # Slice off the character <·> that is at the end of the word.
        reordered = reordered[:-1]

    return reordered.replace("' ", " ").replace("· ", " ")

def test_function():
    test_words = ["dut!pro!para.ion.al.ism:e", "dut!pro!pos.ion"]
    for word in test_words:
        reordered = reorder_morphemes(word)
        print(reordered)

pandunia_words = helpers.simple_file_reader("morfime.txt")
word = pandunia_words.readline()
while word != "":
    word = pandunia_words.readline()
    reordered = reorder_morphemes(word.strip())
    print(reordered)
