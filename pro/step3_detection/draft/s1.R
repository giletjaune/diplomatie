# metaparameters
folder = "C:/Serge/rgx/"
file = "DATA_the_book_df.rds"
pathfile = paste0(folder,file)
library(htmltools)


# Creation data
df = readRDS(file = pathfile)
metadata = paste0(df$tome_id,"_",df$page_id_document)
valuedata = df$paragraph_value
df = data.frame(metadata,valuedata,stringsAsFactors = F)




# add horizntal line before
df$metadata_html = paste0("<p>",df$metadata,"</p>")
df$valuedata_html = paste0("<p>",df$valuedata,"</p>")



dfvector = from_2d_df_to_one_vector(df[,c("metadata_html","valuedata_html")])

dfvector = HTML(dfvector[1000:2010])

html_print(dfvector)


# Fonction qui map correctement une matrice deux colonnes a un vector une colonne
from_2d_df_to_one_vector = function(tempdf){
  res = as.vector(t(tempdf))
  return(res)
}
one_vector_before_hmtl = from_2d_df_to_one_vector(tempdf)





xx = "<p> Salut les <span style='background-color: red'>gars</span> moi je vais bien </p>"
html_print(HTML(xx))

av = letters[1:10]


















# filter fun, create filter column
folder = "C:/Serge/rgx/"
file = "DATA_the_book_df.rds"
pathfile = paste0(folder,file)
df = readRDS(file = pathfile)




# FUN create a filter column
# add a column to a dataframe dfname is a character
add_column_filterto_a_dataframe=function(dfname,string_command){
  string_command_corrected  = paste0(dfname,"$filter = ",string_command) 
  eval(expr = parse(text = string_command_corrected),envir = .GlobalEnv)
}
# TEST FUN
string_command = "df$paragraph_id %in% 1"
add_column_filterto_a_dataframe(dfname = "df",string_command = string_command)



