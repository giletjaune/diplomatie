rm(list=ls())

# library
library(stringr)
library(dplyr)

# load data
FOLDER_position = paste0(dirname(rstudioapi::getSourceEditorContext()$path),"/")
FOLDER_root = dirname(dirname(dirname(FOLDER_position)))
df = readRDS(file = paste0(FOLDER_root,"/step2_structuration/data/DATA_the_book_df.rds"))
df = df[order(df$page_id_pdf,df$paragraph_id),]
df$rowid = seq(1,nrow(df))

# les fonctions  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 

# INPUT : un dataframe de deux colonnes
# 1 colonne BOOLEAN
# 1 colonne ID
# OUTPUT : ajout d'une 3r colonne au dataframe qui complete les TRUE jusqua la fin de la page
FUN_COMPLETION_TRUE_TO_END = function(vecteur_bool,vecteur_id){
  cumsum_vector = cumsum(vecteur_bool)
  res = (vecteur_id - cumsum_vector) == 1 & cumsum_vector != 0
  return(res)
}

# INPUT : un vecteur BOOLEAN
# OUTPUT : un vecteur de mm taille qui renseigne la distance au précédent TRUE pour chaque TRUE
FUN_DISTANCE_LAST_TRUE = function(vecteur_bool){
  which_vector = which(vecteur_bool)
  the_distances_vector = c(99,diff(which_vector))
  vecteur_res = rep(NA,length(vecteur_bool)) 
  vecteur_res[which_vector] = the_distances_vector
  return(vecteur_res)
}








# * * * * * creation de features * * * * *

# FEATURE

# F01, extraction du premier mot
p = "^\\s*[^[:blank:]]+"
df$FEATURE_01_FIRST_WORD = as.vector(str_extract_all(string = df$paragraph_value,pattern = p,simplify = TRUE))

# F02, nombre de digits
p = "[:digit:]"
df$FEATURE_02_N_DIGITS = str_count(string = df$paragraph_value,pattern = p)

# F03, nombre de caractères
df$FEATURE_03_N_CHAR = nchar(df$paragraph_value)

# F04, nombre de lettres
p = "[:alpha:]"
df$FEATURE_04_N_LETTERS = str_count(string =df$paragraph_value ,pattern = p)

# F05, nombre de lettres et/ou chiffres
p = "[:alnum:]"
df$FEATURE_05_N_LETTERS_DIGITS = str_count(string =df$paragraph_value ,pattern = p)

# F06, nombre de blanks
p = "[:blank:]"
df$FEATURE_06_N_BLANKS = str_count(string =df$paragraph_value ,pattern = p)

# F07, nombre de non blanks
p = "[^[:blank:]]"
df$FEATURE_07_N_NOT_BLANKS = str_count(string =df$paragraph_value ,pattern = p)

# F08, nombre de lettres capitales
p = "(?<=\\().*?(?=\\))"
letters_out_of_parent = gsub(pattern =p,replacement = "",x = df$paragraph_value,perl = T)
df$FEATURE_08_N_UPPER  = str_count(string = letters_out_of_parent,pattern = "[:upper:]")




# F09, nombre de lettres minuscules
p = "[:lower:]"
df$FEATURE_09_N_LOWER = str_count(string =df$paragraph_value ,pattern = p)

# F10, nombre de parenthèses
p="[\\(|\\)]"
df$FEATURE_10_N_PARENT = str_count(string = df$paragraph_value,pattern = p)

# F11, nombre de ponctuation
p = "[:punct:]"
df$FEATURE_11_N_PUNCT = str_count(string = df$paragraph_value,pattern = p)

# F12, nombre de paragraphes dans la page
df = df %>%
  group_by(page_id_pdf) %>%
  mutate(FEATURE_12_N_PARAG = n())

# F13, ajout du reverse id
df$FEATURE_13_REVERSE_ID = df$FEATURE_12_N_PARAG - df$paragraph_id

# F14, le paragraphe se termine-t-il par un point?
p = "\\.\\s*$"
df$FEATURE_14_LAST_POINT_BOOL = str_detect(string = df$paragraph_value,pattern = p)

# F15, proportion de majuscules >0.8
df$FEATURE_15_LOT_UPPER = (df$FEATURE_08_N_UPPER / df$FEATURE_04_N_LETTERS) > 8


# F16, nombre de chiffres dans le first word?
p = "[:digit:]"
df$FEATURE_16_N_DIGITS_FIRST_WORD = str_count(string = df$FEATURE_01_FIRST_WORD,pattern = p)

# F17, nombre de caracteres dans le first word
df$FEATURE_17_N_CHAR_FIRST_WORD = nchar(df$FEATURE_01_FIRST_WORD)

# F18, parentheses dans le first word?
p="[\\(|\\)]"
df$FEATURE_18_N_PARENT_FIRST_WORD = str_count(string =df$FEATURE_01_FIRST_WORD ,pattern = p)









# F20, nombre de lettres a linterieur de parentheses
p = "(?<=\\().*?(?=\\))"
within_parenthesis_list = regmatches(x = df$paragraph_value,
                                     gregexpr(pattern = p,
                                              text = df$paragraph_value,
                                              perl = TRUE))
df$FEATURE_20_N_LETTERS_WITHIN_PARENT = sapply(within_parenthesis_list,function(match){
  if (length(match) == 0) {
    res = 0
  } else {
    res = str_count(string = paste0(match,collapse=" "),pattern ="[:alpha:]")
  }
})



# F21, nombre de lettres hors des parentheses
df$FEATURE_21_N_LETTERS_OUT_PARENT = df$FEATURE_04_N_LETTERS - df$FEATURE_20_N_LETTERS_WITHIN_PARENT


# F22, paragraphe riche en upper case uniquement hors parentheses
df$FEATURE_22_RICH_UPPER_OUT_PARENT = df$FEATURE_08_N_UPPER / df$FEATURE_21_N_LETTERS_OUT_PARENT > 0.6


# F19, DISTANCE AU DERNIER PARAGRAPHE WITH LOTTA UPPER
df$FEATURE_19_DISTANCE_TO_LOTTA_UPPER = FUN_DISTANCE_LAST_TRUE(df$FEATURE_22_RICH_UPPER_OUT_PARENT & df$FEATURE_04_N_LETTERS>15 & df$page_id_pdf>31)


# F23, nombre de majuscules global
p = "[:upper:]"
df$FEATURE_23_N_UPPER_GLOBAL = str_count(string =df$paragraph_value ,pattern = p)



# F30 nomùbre de lettres avant le last true
yy = df$FEATURE_19_DISTANCE_TO_LOTTA_UPPER[!is.na(df$FEATURE_19_DISTANCE_TO_LOTTA_UPPER)]
xx = df$rowid[!is.na(df$FEATURE_19_DISTANCE_TO_LOTTA_UPPER)]
dd = unlist(lapply(seq_along(xx),function(idx){
  rowid = xx[idx]
  last = yy[idx]
  # df$paragraph_value[(rowid-last) : rowid]
  # paste0(df$paragraph_value[rowid-last : rowid],collapse=" ")
  res = str_count(string = paste0(df$paragraph_value[(rowid-last) : rowid],collapse = " "),pattern = "[:alpha:]")
  n_letters_first = str_count(string = df$paragraph_value[(rowid-last)],pattern = "[:alpha:]")
  n_letters_last = str_count(string = df$paragraph_value[rowid],pattern = "[:alpha:]")
  res = res - n_letters_last - n_letters_first 
}))

df$FEATURE_30_N_LETTERS_DISTANCE_TO_LAST_RICH_UPPER = NA
df$FEATURE_30_N_LETTERS_DISTANCE_TO_LAST_RICH_UPPER[!is.na(df$FEATURE_19_DISTANCE_TO_LOTTA_UPPER)] = dd





# rules for detection * * * * * * * * * 

# DETECT FIRST PARAGRAPH DEPECT
# En francais : un paragraphe marque le début d'une dépêche si 
# premier mot contient au moins un chiffre
# riche en majuscule
# derniere paragraphe riche en majuscule distant de plus de 2
# nombre de caractères > 15
# as.logical(df$FEATURE_16_N_DIGITS_FIRST_WORD) &
rowtokeep =  df$FEATURE_22_RICH_UPPER_OUT_PARENT & df$FEATURE_19_DISTANCE_TO_LOTTA_UPPER>2 & df$FEATURE_03_N_CHAR>15 & df$page_id_pdf>31& df$page_id_pdf<383 & df$FEATURE_30_N_LETTERS_DISTANCE_TO_LAST_RICH_UPPER>30
rowtokeep[is.na(rowtokeep)] = FALSE
df$MARK_DEPECHE = cumsum(rowtokeep)

names(df)
tt = df[,c("paragraph_value",
           "paragraph_id",
           "MARK_DEPECHE",
           "page_id_document",
           "page_id_pdf",
           "FEATURE_22_RICH_UPPER_OUT_PARENT",
           "FEATURE_19_DISTANCE_TO_LOTTA_UPPER",
           "FEATURE_03_N_CHAR",
           "FEATURE_08_N_UPPER",
           "FEATURE_21_N_LETTERS_OUT_PARENT")]


