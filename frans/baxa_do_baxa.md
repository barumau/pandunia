# Instructions pour la traduction de ce site

## Téléchargement des textes sources

La plupart des contenus texte de ce site sont stockés dans un système de contrôle de version qui est hébergé par GitHub [ici](https://github.com/barumau/pandunia). Le système conserve [l'historique des modifications](https://github.com/barumau/pandunia/commits/master),  [la liste des contributeurs](https://github.com/barumau/pandunia/graphs/contributors) et d'autres choses. Vous pouvez commencer avec GitHub en lisant leurs [guides](https://guides.github.com/).

GitHub propose deux façons de télécharger le contenu du dépôt de versions. 
Cliquez sur le bouton "Clone or download".

1. Vous pouvez le télécharger sous forme de fichier ZIP.
    * Dans ce cas vous pouvez envoyer les fichiers mis à jour par email à risto@pandunia.info
2. Si vous avez l'habitude de programmer, vous pouvez cloner le dépôt avec Git.
    * Dans ce cas vous pouvez créer un _pull request_ dans GitHub.

## Ecrire avec la syntaxe Markdown

Les contenus du site Pandunia sont écrits en text brut en utilisant le format Markdown. Le Markdown est une syntaxe légère et facile d'utilisation qui est parfaitement lisible en text brut. Voir la description de la syntaxe Markdown [ici](https://guides.github.com/features/mastering-markdown/) ou [ici](https://daringfireball.net/projects/markdown/syntax).

## Voir les changements en local

Le site Pandunia utilise un système de gestion de contenu basé sur le Markdown appelé [Up](http://twisty.org/post/up) pour afficher le contenu. Vous n'avez pas besoin de l'installer localement.

Autre méthode, vous pouvez utiliser [MDwiki](http://dynalon.github.io/mdwiki/). Copiez simplement mdwiki.html dans le même dossier où se trouvent les textes pandunia (index.md, navigation.md et le reste), double-cliquez sur mdwiki.html pour l'ouvrir dans votre navigateur et vous êtes prêt !



## Traduction

### Langue source

L'anglais est la langue par défaut du site Pandunia. Il est donc recommandé d'utiliser cette version comme langue source de vos traductions. Autrement veillez à choisir une langue à jour et complète.

### Que dois-je traduire en priorité ?

Lorsque vous commencez à traduire pour une nouvelle langue, commencez à partir de ces fichiers.

* index.md
    * Cette page devrait inclure une courte introduction au Pandunia.
    * N'inclure dans cette page que les liens dont les pages existent et/ou sont prêtes.
    * Si votre version est incomplète, redirigez le lecteur vers une autre version (comme l'anglais).
* navigation.md
    * C'est le menu principal du site
    * N'inclure dans cette page que les liens dont les pages existent et/ou sont prêtes.
* abc.md
    * Cette page explique comment prononcer le Pandunia
* fraze.md
    * Cette page présente les mots de base, les phrases et les structures grammaticales.
* kanun.md
    * C'est la page de la grammaire
    * Traduisez au moins le chapitre nommé _Les règles de base_

### Traduire des documents entiers

1. Copier le fichier source dans le dossier de la nouvelle langue
    * Gardez le nom original ! Les noms des fichiers sont en Pandunia de sorte à comparer les différentes versions de langue plus facilement.
2. Traduire le contenu
3. Si la traduction est incomplète à la fin
    * Supprimez les textes non-traduits
    * ou cachez-les entre < ! - - et - - > (sans espaces) de sorte à ce qu'ils ne soient pas visible sur le site

### Mise à jour des traductions

La meilleure façon de mettre à jour des traductions ainsi que de traduire des parties de documents est d'utiliser un programme qui compare deux fichiers côte à côte. Un outil tel que BeyondCompare est idéal.

Les mots et phrases en Pandunia devraient être les mêmes dans les deux langues, de sorte à servir de points d'ancrage et ainsi garder les différentes versions sur les mêmes lignes.

![](http://www.pandunia.info/grafe/kompar.png "Comparing two language versions")

### Recommandations

* Utiliser un langage simple et concis
    * Les lecteurs peuvent être de tout âge et avoir différent niveau d'éducation
    * Certaines langues sont lues par des locuteurs non-natifs également
* Utilisez les exemples originaux fournis en Pandunia pour simplifier la comparaison entre versions
* Utilisez un langage courant
    * Si un mot ne sonne pas juste dans votre langue, lorsque traduit depuis l'anglais (ou autre langue), changez-le par un terme plus naturel.
* Vous pouvez également améliorer le texte d'origine
    * Le texte d'origine n'est pas parfait. Il peut contenir des formulations incorrectes ou des erreurs.
    * Vous pouvez même proposer de nouveaux châpitres et leçons

