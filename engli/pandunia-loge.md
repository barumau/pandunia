The pandunia-loge.csv in not valid by RFC 4180.

The following are the differences:

1. The first two lines are header lines and the values in the second are only series of dashes (-).
2. The values are seperated by pipes (|).

Here are descriptions of headers:

1. "pandunia" - words, phrases or affixes in Pandunia
2. "klase" - auxiliary classification of a word; including grammatical roles and holonyms
3. "" - conventional symbols of referents (i.e. translations to scientific nomenclature).
4. "logasle" - etymology of a word (syntax described below)
5. "engli" - translations to English
6. "fransi" - translations to French
7. "espani" - translations to Spanish
8. "portugali" - translations to Portugese
9. "rusi" - translations to Russian
10. "arabi" - translations to Arabic
11. "putong cini" - translations to Mandarin Chinese
12. "niponi" - translations to Japanese
13. "cosesni" - translations to Korean
14. "vieti" - translations to Vietnamese
15. "hindi" - translations to Hindu
16. "bangli" - translations to Bengali
17. "malayi" - translations to Malay
18. "swahili" - translations to Swahili
19. "turki" - translations to Turkish
20. "esperanti" - translations to Esperanto
21. "suomi" - translations to Finnish
22. "polski" - translations to Polish

Each translation value can consist of more than one word or phrase. Additional translations are then surrounded by bracets and separated by comma and space (, ) sequence.

Syntax of "logasle":

1. Each value contains zero or more language blocks.
2. If there are more than one language block, they are seperated by comma and space (, ) sequence.
3. Each language block starts with ISO 639-3 code and a colon (ex. "eng:").
4. Each language block contains one or more source words.
5. If there are more than one source words in a language block, they are seperated by comma and space (, ) sequence.

How to translate?

Open the file in your csv editor of choice and fill the gaps in a column that you are interested in based on values in other columns. It is advised to used a spreadsheet editor, hide not useful columns, and use filter function.
