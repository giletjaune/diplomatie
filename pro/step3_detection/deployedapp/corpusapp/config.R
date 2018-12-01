# On charge le dataframe du corpus
df = readRDS(file = "DATA_the_book_df.rds")

# Ici on peut construire autant de features qu'on veut
# Ces metrics pourront nous servir à déterminer des entités particulières
# Ces metrics pourront également servir à définir un filtre dans l'application Shiny
df$FEATURE_01 = nchar(df$paragraph_value)
