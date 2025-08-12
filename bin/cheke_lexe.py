"""Validate Pandunia words in temp/pan_lexe.txt against ../panlexia/dict/P/pandunia.tsv.

CC-BY 2025 Risto Kupsala (https://github.com/barumau/pandunia)
"""
import pandas as pd

def get_unique_words_in_pandunia_dictionary():
    df = pd.read_csv('../panlexia/dict/P/pandunia.tsv', sep='\t')
    words = df['word']
    unique_words = list(set(words))
    return sorted(unique_words)

lexicon = get_unique_words_in_pandunia_dictionary()

with open("temp/pan_lexe.txt", 'r') as file:
    unlisted_words = []
    for line in file:
        # Lines are in format: filename.md: word1 word2 word3
        filename = line.split(':')[0]
        words = line.split(':')[1].split(' ')
        for word in words:
            word = word.strip().lower()
            word = word.replace('.', '')
            word = word.replace(',', '')
            if word not in lexicon:
                unlisted_words.append(f"{filename} {word}")

    unique_words = list(set(unlisted_words))
    unlisted_words = sorted(unique_words)
    for row in unlisted_words:
        print(row)
