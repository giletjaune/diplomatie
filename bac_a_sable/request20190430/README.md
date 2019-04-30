D'une matrice à une liste d'edges pondérés
================

### Load packages & Set meta parameters & load data

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

``` r
data[2:ncol(data)] <- lapply(data[2:ncol(data)], function(x) as.numeric(as.character(x)))
names(data) = iconv(names(data),from="UTF-8",to="ASCII//TRANSLIT")
```

### Main Part

``` r
statistics = data %>% 
  group_by(exped) %>% 
  summarise_each(funs(sum))

reshaped_statistics <- statistics %>%
  gather(key = "mention",
         value ="f",
         names(data)[2:ncol(data)]) %>%
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
