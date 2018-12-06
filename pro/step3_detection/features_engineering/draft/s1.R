rm(list=ls())

# library
library(stringr)
library(stringi)
library(dplyr)

# load data
# FOLDER_position = paste0(dirname(rstudioapi::getSourceEditorContext()$path),"/")
# # FOLDER_root = dirname(dirname(dirname(FOLDER_position)))
# # df = readRDS(file = paste0(FOLDER_root,"/step2_structuration/data/DATA_the_book_df.rds"))
# df = readRDS(file =paste0(FOLDER_position,"DATA_the_book_df.rds"))
# df = df[order(df$page_id_pdf,df$paragraph_id),]
# df$rowid = seq(1,nrow(df))


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
FUN_COMPLETION_TRUE_TO_END = function(vecteur_bool,vecteur_id){
  res = as.logical(unlist(lapply(split(x = vecteur_bool,f = vecteur_id),cumsum)))
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


# function qui prend en input un vecteur bool
# et qui renvoie un vecteur bool qui représente la fin d une succession de T
FUN_REP_FIN_SEQ_TRUE = function(vecteur_bool){
  stats = rle(vecteur_bool)
  id = cumsum(stats$lengths)[stats$values==TRUE]
  solution = rep(FALSE,length(vecteur_bool))
  solution[id] = TRUE
  return(solution)
}


FUN_REP_DEBUT_SEQ_TRUE = function(vecteur_bool){
  stats = rle(rev(vecteur_bool))
  id = cumsum(stats$lengths)[stats$values==TRUE]
  solution = rep(FALSE,length(vecteur_bool))
  solution[id] = TRUE
  return(rev(solution))
}



months_vector = c("janvier",
                  "février",
                  "fevrier",
                  "mars",
                  "avril",
                  "mai",
                  "juin",
                  "juillet",
                  "aout",
                  "août",
                  "septembre",
                  "octobre",
                  "novembre",
                  "decembre",
                  "décembre")




nletters_month_fun = function(a_string){
  
  res = unlist(stri_extract_all_fixed(str = a_string,
                                      pattern = months_vector,
                                      opts_fixed = list(case_insensitive = TRUE)))
  res = res[!is.na(res)]
  res = nchar(paste0(res,collapse = ""))
  return(res)
  
}

n_letters_month_vector_fun = function(text_vector){
  
  ff = sapply(text_vector,nletters_month_fun)
  names(ff) = NULL
  return(ff)
  
}



# * * * * * creation de features * * * * *

# FEATURE

# F01, extraction du premier mot
p = "^\\s*[^[:blank:]]+"
df$FEATURE_01_FIRST_WORD = as.vector(str_extract_all(string = df$paragraph_value,pattern = p,simplify = TRUE))
df$FEATURE_01_FIRST_WORD = str_squish(df$FEATURE_01_FIRST_WORD)

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
df$FEATURE_13_REVERSE_ID = df$FEATURE_12_N_PARAG - df$paragraph_id + 1

# F14, le paragraphe se termine-t-il par un point?
p = "[\\.\\?\\!\\)\\]]\\s*$"
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

# F31, le paragraphe est dans le tiers bas de la bas page
df$FEATURE_31_BOTTOM_PAGE = df$FEATURE_13_REVERSE_ID<=ceiling(df$FEATURE_12_N_PARAG / 3)



# F32, le paragraphe précédent contient un point a la fin
df$FEATURE_32_LAST_PARAGRAPH_LAST_POINT_BOOL = c(FALSE,df$FEATURE_14_LAST_POINT_BOOL[1:(length(df$FEATURE_14_LAST_POINT_BOOL)-1)])


# F33, paragraphe riche en lettre minuscule
df$F33_RICHE_LOWER = (df$FEATURE_09_N_LOWER / df$FEATURE_04_N_LETTERS) > 0.6


# F34, fin de paragraphe suspecte - \\s ,
p = "[\\,\\-\\s[:alpha:]]+\\s*$"
df$FEATURE_34_FIN_SUSPECTE = str_detect(string = df$paragraph_value,pattern = p)

# F35, paragraphe precedent avec une fin suspecte
df$FEATURE_35_PREV_PARAGRAPH_FIN_SUSPECTE = c(FALSE,df$FEATURE_34_FIN_SUSPECTE[1:(length(df$FEATURE_34_FIN_SUSPECTE)-1)])

# F35b, nombre de Je ou de J'
p0 = "(^|\\b)(je|Je|votre|Votre|Vous|vous|ton|Ton|tes|Tes|vos|Vos|ma|Ma|mes|Mes)\\b"
p1 = "(^|\\b)(j'|J')[:alpha:]+?"
df$FEATURE_35A_N_CONJUGAISON_FIRST = str_count(string = df$paragraph_value,pattern = p0) + str_count(string = df$paragraph_value,pattern = p1)




# rules for detection * * * * * * * * * 

# DETECT FIRST PARAGRAPH DEPECT
# En francais : un paragraphe marque le début d'une dépêche si 
# premier mot contient au moins un chiffre
# riche en majuscule
# derniere paragraphe riche en majuscule distant de plus de 2
# nombre de caractères > 15
# as.logical(df$FEATURE_16_N_DIGITS_FIRST_WORD) &
rowtokeep =  df$FEATURE_22_RICH_UPPER_OUT_PARENT & df$FEATURE_19_DISTANCE_TO_LOTTA_UPPER>2 & df$FEATURE_03_N_CHAR>15 & df$page_id_pdf>31 & df$page_id_pdf<383 & df$FEATURE_30_N_LETTERS_DISTANCE_TO_LAST_RICH_UPPER>30
rowtokeep[is.na(rowtokeep)] = FALSE
df$MARK_DEPECHE = cumsum(rowtokeep)

df = df %>%
  group_by(MARK_DEPECHE)%>%
  mutate(MARK_DEPECHE_RANKID = row_number())

df$MARK_DEPECHE_FIRST = df$MARK_DEPECHE_RANKID == 1



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






# creation de  features supplémentaires
df$FEATURE_36_PREVIOUS_IS_MARK_DEPECHE = c(FALSE,df$MARK_DEPECHE_FIRST[1:(length(df$MARK_DEPECHE_FIRST)-1)])
# detection second line title
# un paragraphe est la suite d'un titre si
# son predecessur est un mark depeche ...  FEATURE_36_PREVIOUS_IS_MARK_DEPECHE
# sa proportion de majuscule hors parenthese est élevé ... FEATURE_22_RICH_UPPER_OUT_PARENT
# on se permet detre un peu plus lache sur la richesse des majsucules car cest tres cible maitnenant
rowtokeep = df$FEATURE_36_PREVIOUS_IS_MARK_DEPECHE & (df$FEATURE_08_N_UPPER / df$FEATURE_21_N_LETTERS_OUT_PARENT > 0.4)
rowtokeep[is.na(rowtokeep)] = FALSE
df$MARK_SECOND_LINE_TITLE = rowtokeep

names(df)
tt = df[,c("paragraph_value",
           "paragraph_id",
           "page_id_document",
           "page_id_pdf","MARK_DEPECHE",
           "MARK_SECOND_LINE_TITLE",
           "MARK_DEPECHE_FIRST",
           "FEATURE_36_PREVIOUS_IS_MARK_DEPECHE",
           "FEATURE_22_RICH_UPPER_OUT_PARENT")]











# detection meta paragraph * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 

# f37
df$FEATURE_37_BORN_TITLE = FUN_REP_FIN_SEQ_TRUE(df$MARK_DEPECHE_FIRST | df$MARK_SECOND_LINE_TITLE)

# f38
df$FEATURE_38_ZONE_AFTER_TITLE = cumsum(df$FEATURE_37_BORN_TITLE)

# f39
df = df%>%
  group_by(FEATURE_38_ZONE_AFTER_TITLE) %>%
  mutate(FEATURE_39_DISTANCE_TO_TITLE= row_number() - 1 )

# F40, le nombre de lettres que représente les mois de l'année
df$FEATURE_40_MONTHS_N_LETTERS = n_letters_month_vector_fun(df$paragraph_value)

# f41, nombre de lettres avec pattern metadata
df$FEATURE_41_N_LETTERS_METADATA = (df$FEATURE_11_N_PUNCT + df$FEATURE_02_N_DIGITS + df$FEATURE_40_MONTHS_N_LETTERS)
df$FEATURE_41_N_LETTERS_METADATA[is.na(df$FEATURE_41_N_LETTERS_METADATA)] = 0


# f42, proportion de lettres metadata
df$FEATURE_42_P_LETTERS_METADATA = (df$FEATURE_11_N_PUNCT + df$FEATURE_02_N_DIGITS + df$FEATURE_40_MONTHS_N_LETTERS) / df$FEATURE_04_N_LETTERS
df$FEATURE_42_P_LETTERS_METADATA[is.na(df$FEATURE_42_P_LETTERS_METADATA)] = 0


# f43, proportion du paragraphe entre parentheses
df$FEATURE_43_P_PARAGRAPHE_WITHIN_PARENT = df$FEATURE_20_N_LETTERS_WITHIN_PARENT / df$FEATURE_04_N_LETTERS



# detection de paragraph metadata
names(df)
tt = df[,c("page_id_pdf","paragraph_id","paragraph_value","FEATURE_37_BORN_TITLE",
           "FEATURE_42_P_LETTERS_METADATA","FEATURE_43_P_PARAGRAPHE_WITHIN_PARENT","FEATURE_39_DISTANCE_TO_TITLE",
           "FEATURE_41_N_LETTERS_METADATA","FEATURE_04_N_LETTERS","FEATURE_02_N_DIGITS","FEATURE_11_N_PUNCT","FEATURE_40_MONTHS_N_LETTERS")]

df$MARK_METADATA_PRELIMINARYDECISION = (df$FEATURE_42_P_LETTERS_METADATA>0.5 | df$FEATURE_43_P_PARAGRAPHE_WITHIN_PARENT>0.5) & df$FEATURE_39_DISTANCE_TO_TITLE < 5 & df$FEATURE_39_DISTANCE_TO_TITLE > 0 & df$FEATURE_04_N_LETTERS < 50

yy = lapply(split(x = df$MARK_METADATA_PRELIMINARYDECISION,f = df$MARK_DEPECHE),function(vecbool){
  v = FUN_REP_DEBUT_SEQ_TRUE(vecbool)
  thecumsumvector = cumsum(v)
  res = vecbool == TRUE & thecumsumvector == 1
  return(res)
})


df$MARK_METADATA = unlist(yy)





names(df)
tt = df[,c("page_id_pdf","paragraph_id","paragraph_value","MARK_DEPECHE_FIRST","FEATURE_37_BORN_TITLE","MARK_METADATA")]




# 
# yy[50:60]
# 
# split(x = df$MARK_METADATA_PRELIMINARYDECISION,f = df$MARK_DEPECHE)[50:60]
# 
# 
# split(x = df$paragraph_value,f = df$MARK_DEPECHE)[50:60]


# detection garbage * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 

# creation de la feature not allowed
df$FEATURE_44_NOT_TITLE_NOT_META = !(df$MARK_METADATA | df$MARK_SECOND_LINE_TITLE | df$MARK_DEPECHE_FIRST)

# premier mot de taille inférieur à 5 caracteres
# premier contient au moiuns une parenthese ou au moins un chiffre
# paragraphe au moins dans le tiers bas de la page

# paragraph davant ne se termine pas par un point
# paragraphe au moins dans le tiers bas de la page

df$rowtokeep1 = df$FEATURE_44_NOT_TITLE_NOT_META & nchar(df$FEATURE_01_FIRST_WORD)<5 & (as.logical(df$FEATURE_18_N_PARENT_FIRST_WORD) | as.logical(df$FEATURE_16_N_DIGITS_FIRST_WORD)) & (df$FEATURE_31_BOTTOM_PAGE |df$FEATURE_13_REVERSE_ID<6)  & df$page_id_pdf>31 & df$page_id_pdf<383 & df$F33_RICHE_LOWER & df$paragraph_id != 1 & df$FEATURE_35A_N_CONJUGAISON_FIRST<1
df$rowtokeep2 = df$FEATURE_44_NOT_TITLE_NOT_META & df$FEATURE_35_PREV_PARAGRAPH_FIN_SUSPECTE & (df$FEATURE_31_BOTTOM_PAGE | df$FEATURE_13_REVERSE_ID<6) & df$page_id_pdf>31 & df$page_id_pdf<383 & df$F33_RICHE_LOWER & df$paragraph_id != 1 & df$FEATURE_35A_N_CONJUGAISON_FIRST<1
df$MARK_GARBAGE = df$rowtokeep1 | df$rowtokeep2
df$MARK_GARBAGE[is.na(df$MARK_GARBAGE)] = FALSE





# Creation du rank markpage + garbage clean
xx = df %>%
  group_by(page_id_pdf) %>%
  filter(MARK_GARBAGE == TRUE) %>%
  mutate(RANK_MARK_GARBAGE = row_number())
xx = xx[,c("paragraph_id","page_id_pdf","RANK_MARK_GARBAGE")]
df = merge(x = df,
           y = xx,
           by = c("paragraph_id","page_id_pdf"),
           all.x = TRUE)

df = df[order(df$page_id_pdf,df$paragraph_id),]
df$MARK_GARBAGE_FIRST = ifelse(test = df$MARK_GARBAGE & df$RANK_MARK_GARBAGE==1, yes = TRUE ,no =FALSE)



df$GARBAGE_CLEAN = FUN_COMPLETION_TRUE_TO_END(vecteur_bool = df$MARK_GARBAGE_FIRST,vecteur_id =df$page_id_pdf)




tt = df[,c(
           "paragraph_id",
           "page_id_pdf",
           "paragraph_value","GARBAGE_CLEAN","FEATURE_35A_N_CONJUGAISON_FIRST","FEATURE_44_NOT_TITLE_NOT_META",
           "RANK_MARK_GARBAGE",
           "MARK_GARBAGE_FIRST",
           "MARK_GARBAGE",
           "rowtokeep1",
           "rowtokeep2",
           "FEATURE_01_FIRST_WORD",
           "FEATURE_18_N_PARENT_FIRST_WORD",
           "FEATURE_16_N_DIGITS_FIRST_WORD",
           "FEATURE_31_BOTTOM_PAGE",
           "FEATURE_32_LAST_PARAGRAPH_LAST_POINT_BOOL",
           "FEATURE_13_REVERSE_ID",
           "FEATURE_12_N_PARAG")]
