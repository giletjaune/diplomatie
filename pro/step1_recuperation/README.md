Récupération des données (API Gallica)
================

#### Objectif

L'objectif est de récupérer l'ensemble des tomes sur lesquels on souhaite travailler sous forme d'une liste de tomes. L'execution du script `main.R` permet de réaliser l'objectif. Pour rappel :

-   Un tome est une liste de pages
-   Une page est un vecteur de paragraphes

#### Paramètres

L'unique paramètre est le vecteur `PARAM_urls`. Il contient les requêtes à l'API Gallica. Il est défini dans ***/config/parameters***. Le vecteur doit être nommé. Les noms doivent représentent le nom des tomes associés à chacune des requêtes.

``` r
PARAM_urls = c("https://gallica.bnf.fr/ark:/12148/bpt6k96718891.texteBrut",
               "https://gallica.bnf.fr/ark:/945221/gfrt6kfrer64.texteBrut")
```

#### Sauvegarde

La liste de tomes récupérée est sauvée dans le dossier ***/data*** sous le nom `DATA_the_book.rds`
