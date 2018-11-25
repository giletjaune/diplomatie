Passer d'un pattern début de dépêche à une liste de dépêches
================

I. Objectif
-----------

#### INPUT

-   Un document représentée par une liste de pages. Chaque page comprenant un vecteur de paragraphes.
-   Un pattern représentant le début d'une dépêche OUI / NON

#### OUTPUT

-   Une liste de dépêches avec le numero de pages en meta données.

II. Data and Libraries
----------------------

``` r
library(stringr)
```

    ## Warning: package 'stringr' was built under R version 3.3.3

``` r
library(knitr)
```

    ## Warning: package 'knitr' was built under R version 3.3.2

``` r
monlivre = list()
monlivre[["page_01"]] = c("Je suis pas très chaud d'aller à la manifestation.",
                          "J'aime bien ce que fait Zemmour.",
                          "Apparemment, je ne suis pas convaincu")
monlivre[["page_02"]] = c("Les data scientists sont de plus en plus nombreux.",
                          "Jamais dans l'histoire de l'humanité, autant de documents n'ont été produits sans être lus.",
                          "Les mauvais artistes pillent, les meilleurs copient")
monlivre
```

    ## $page_01
    ## [1] "Je suis pas très chaud d'aller à la manifestation."
    ## [2] "J'aime bien ce que fait Zemmour."                  
    ## [3] "Apparemment, je ne suis pas convaincu"             
    ## 
    ## $page_02
    ## [1] "Les data scientists sont de plus en plus nombreux."                                         
    ## [2] "Jamais dans l'histoire de l'humanité, autant de documents n'ont été produits sans être lus."
    ## [3] "Les mauvais artistes pillent, les meilleurs copient"

III. Les fonctions
------------------

Afin d'e résoudre d'atteindre notre objectifs, on définit des fonctions qui vont accomplire des petites tâches bien précises.

#### Fonction split\_vector\_from\_positions

``` r
# INPUT : le vecteur de départ à splitter
# INPUT : le vecteur indiquant les positions du début d'une dépêche
# OUTPUT : une liste contenant le découpage du vecteur

split_vector_from_positions=function(document,starting_index){

  boolean_starting_index = seq(1,length(document)) %in% starting_index
  depeche_factor = cumsum(boolean_starting_index)
  solution = split(x = document,f = depeche_factor)
  
  return(solution)
  
}
```

#### Fonction detect\_starting\_depeche

``` r
# INPUT : un vecteur de départ de paragraphes
# INPUT : une regex qui permet de dire si oui ou non un paragraphe marque le début
# d'une dépêche
# OUTPUT : un vecteur de taille égal au vecteur de départ contenant TRUE ou FALSE
# En fonction de si ce paragraphe marque le début d'une dépêche ou non
detect_starting_depeche=function(vecteur_de_paragraphes,pattern){
  
  solution = str_detect(vecteur_de_paragraphes,pattern)
  
  return(solution)
  
}
# C'est une réecriture de la fonction str_detect mais ça permet d'expliquer la démarche générale.
```

#### Fonction from\_list\_to\_dataframe

``` r
# INPUT : une liste de dimension 2 dont les éléments sont tous nommés
# OUTPUT : Stacking des valeurs de la liste dans un dataframe
# Une colonne high granularite ID qui représente l'ID du "tiroir" le plus haut dans la hierarchie
# Une colonne low granularite ID qui représente l'ID de l'élément le plus bas dans la hiérarchie 
from_list_to_dataframe=function(maliste){
  
  ids = names(unlist(maliste))
  matrix_ids = do.call("rbind",strsplit(x = ids,split = ".",fixed = T))
  solution = as.data.frame(cbind(matrix_ids,unlist(maliste)))
  names(solution) = c("highid","lowid","val")
  row.names(solution) = NULL
  
  return(solution)
}
```

IV. Tests des petites fonctions
-------------------------------

``` r
# Test 1 : split_vector_from_positions
document = c(44,22,6,7,9,11,33,1,5,3,185,2)
starting_index = c(1,5,7)
split_vector_from_positions(document,starting_index)
```

    ## $`1`
    ## [1] 44 22  6  7
    ## 
    ## $`2`
    ## [1]  9 11
    ## 
    ## $`3`
    ## [1]  33   1   5   3 185   2

``` r
# Test 2 : detect_starting_depeche
vecteur_de_paragraphes = c("salutr tu vais, bien",
                           "Oui je vais bien et toi",
                           "Je suis chaud")
pattern = "^[A-Z]"
detect_starting_depeche(vecteur_de_paragraphes,pattern)
```

    ## [1] FALSE  TRUE  TRUE

V. Putting it all together
--------------------------

#### La fonction maestro

Maintenant qu'on a nos petites fonctions, on construit une espèce de fonction *"chef d'orchestre"* qui va mettre tout ça en branle afin de répondre à l'objectif.

``` r
# INPUT : une liste de pages. Chaque page étant représentée par un vecteur de paragraphe
# INPUT : une regex permettant de détecter un paragraphe marquant le début d'une dépêche
# OUTPUT : un dataframe dans lequel une ligne correspond à un paragraphe. Chaque paragraphe
# étant mappé vers l'id d'une page et l'id d'une dépêche
convert_une_liste_de_pages_en_dataframe_de_depeches = function(maliste,
                                                               pattern_to_detect_starting_depeche){
  mesparagraphes = unlist(maliste)
  boolean_starting_depeche = detect_starting_depeche(mesparagraphes,pattern_to_detect_starting_depeche)
  index_starting_depeche = which(boolean_starting_depeche)
  mesdepeches = split_vector_from_positions(mesparagraphes,index_starting_depeche)
  mesdepeches_dataframe = from_list_to_dataframe(mesdepeches)
  names(mesdepeches_dataframe) = c("id_depeche","id_paragraphe","paragraphe")
  
  return(mesdepeches_dataframe)
}
```

#### Test de la fonction maestro

``` r
p = "^J"
final_solution = convert_une_liste_de_pages_en_dataframe_de_depeches(monlivre,p)
```

| id\_depeche | id\_paragraphe | paragraphe                                                                                  |
|:------------|:---------------|:--------------------------------------------------------------------------------------------|
| 1           | page\_011      | Je suis pas très chaud d'aller à la manifestation.                                          |
| 2           | page\_012      | J'aime bien ce que fait Zemmour.                                                            |
| 2           | page\_013      | Apparemment, je ne suis pas convaincu                                                       |
| 2           | page\_021      | Les data scientists sont de plus en plus nombreux.                                          |
| 3           | page\_022      | Jamais dans l'histoire de l'humanité, autant de documents n'ont été produits sans être lus. |
| 3           | page\_023      | Les mauvais artistes pillent, les meilleurs copient                                         |
