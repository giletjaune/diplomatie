De la matrice d'adjacence à une liste d'edges pondérés
================

### Load packages and data

Bon là je charge tout les packages que je vais utiliser. Le package knitr n'est pas nécessaire pour l'execution du code. dplyr est utilisé pour le groupby et tidyr pour reshape les résultats.

``` r
library(dplyr)
library(tidyr)
library(knitr) # not necessary
filename = "questionsergi.RData"
foldername = "C:/Users/Bar Yokhai/Desktop/projets/Blog/diplomatie/bac_a_sable/request20190430/"
pathile = paste0(foldername,filename)
load(file = pathile)
```

### Prepare the data

Pour la suite, il faut deux conditions. 1) que les colonnes soient au format numeric. 2) que les noms de colonnes ne contiennent pas d'accent. On s'en occupe.

``` r
data[2:ncol(data)] <- lapply(data[2:ncol(data)], function(x) as.numeric(as.character(x)))
names(data) = iconv(names(data),from="UTF-8",to="ASCII//TRANSLIT")
```

### Main Part

On commence par faire un group by sur toutes les colonnes afin de compter le nombre d'occurences par expéditeur et par colonne (fonction groupby et summaris\_each). Puis on reshape le résultat (fonction gather). Enfin on trie la table (fonction arrange).

``` r
weighted_edges = data %>% 
  group_by(exped) %>% 
  summarise_each(funs(sum)) %>%
  gather(key = "mention", value ="f", names(data)[2:ncol(data)]) %>%
  arrange(desc(f))
```

| exped                           | mention    |    f|
|:--------------------------------|:-----------|----:|
| Le Prince de La Tour d Auvergne | Russell    |   32|
| Le Baron de Talleyrand          | Bismarck   |   26|
| Le Duc de Gramont               | Rechberg   |   18|
| Le Prince de La Tour d Auvergne | Palmerston |   11|
| Dotézac                         | Monrad     |   10|
| Dotézac                         | Quaade     |    9|
