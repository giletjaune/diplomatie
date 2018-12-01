# INPUT : un tome (liste de pages)
# INPUT : le nom de la liste tome
# OUTPUT : un dataframe, chaque ligne un paragraphe mappé vers le tome ID,
# la page ID, le paragraph ID
FUN_single_tome_list_to_dataframe = function(untome,tomename){
  
  nparagraph_by_pagename = sapply(untome,length)
  pagename_vector = rep(x = names(nparagraph_by_pagename),nparagraph_by_pagename)
  sentence_vector = unlist(lapply(nparagraph_by_pagename,seq_len),use.names = FALSE)
  paragraph_vector = unlist(untome)
  
  the_tome_name = strsplit(x = tomename,split = "***",fixed = T)[[1]][1]
  the_url_name = strsplit(x = tomename,split = "***",fixed = T)[[1]][2]
  the_url_name = gsub(pattern =".texteBrut",replacement ="" ,x =the_url_name ,fixed = TRUE)
  
  tomedf = data.frame("tome_id" = the_tome_name,
                      "url_id" = the_url_name,
                      "page_id" = pagename_vector,
                      "paragraph_id" = sentence_vector,
                      "paragraph_value" = paragraph_vector,
                      stringsAsFactors = F)
  
  return(tomedf)
}



# INPUT : une liste de tomes nominale
# OUTPUT : un dataframe, chaque ligne un paragraphe mappé vers le tome ID,
# la page ID, le paragraph ID
FUN_multiple_tome_list_to_dataframe = function(list_of_tomes){
  
  list_of_dataframes = lapply(seq_along(list_of_tomes),function(idx_tome){
    cat("\nTome n°", idx_tome, " sur ",length(list_of_tomes))
    tome_name = names(list_of_tomes)[idx_tome]
    tome_value = list_of_tomes[[idx_tome]]
    adf = FUN_single_tome_list_to_dataframe(tome_value,tome_name)
    return(adf)
  })
  
  bigdf = do.call("rbind",list_of_dataframes)
  return(bigdf)
}



# INPUT : tous les tomes en dataframes, une ligne, un paragraphe
# INPUT : le dataframe qui contient les corrections des ids des pages
# OUTPUT : le gros dataframe des tomes avec des colonnes pages ID en plus
# PDF page ID + Document page ID, voir le readme pour la différence
FUN_correction_page_arab_id = function(DATA_the_book_df,PARAM_correction_dataframe){
  DATA_the_book_df = merge(x =DATA_the_book_df ,y = PARAM_correction_dataframe,by = "tome_id",all.x = TRUE)
  DATA_the_book_df$page_id_pdf = as.numeric(DATA_the_book_df$page_id) + DATA_the_book_df$page_id_pdf_correction
  DATA_the_book_df$page_id_document = as.numeric(DATA_the_book_df$page_id) + DATA_the_book_df$page_id_document_correction
  return(DATA_the_book_df)
}



# INPUT : tous les tomes en dataframes, une ligne, un paragraphe
# INPUT : le dataframe qui contient les corrections des ids des pages
# OUTPUT : le gros dataframe des tomes avec la colonne Document Page ID en chiffres romain pour le début
FUN_correction_page_latin_id = function(DATA_the_book_df,PARAM_correction_dataframe){
  
  TEMP_list_of_roman_correction_dataframe = lapply(seq(1:nrow(PARAM_correction_dataframe)),function(idx_row){
    arow = PARAM_correction_dataframe[idx_row,]
    starting = as.vector(unlist(arow$pdf_latin_pagination_start))
    ending = as.vector(unlist(arow$pdf_latin_pagination_end))
    tome_id = as.vector(unlist(arow$tome_id))
    roman_vector = as.character(as.roman(seq(1,ending-starting+1)))
    arab_vector = seq(starting,ending)
    tempdf = list(starting,ending,tome_id,roman_vector,arab_vector,length(arab_vector),length(roman_vector))
    tempdf = data.frame("tome_id" = tome_id,
                        "page_id_pdf" = arab_vector,
                        "document_page_id_roman" = roman_vector,
                        stringsAsFactors = F)
    return(tempdf)
  })
  
  TEMP_roman_correction_dataframe = do.call("rbind",TEMP_list_of_roman_correction_dataframe)
  
  DATA_the_book_df$page_id_document = as.character(DATA_the_book_df$page_id_document)
  DATA_the_book_df = merge(x = DATA_the_book_df,
                           y = TEMP_roman_correction_dataframe,
                           by = c("tome_id","page_id_pdf"),
                           all.x = TRUE)
  DATA_the_book_df$page_id_document[!is.na(DATA_the_book_df$document_page_id_roman)] = DATA_the_book_df$document_page_id_roman[!is.na(DATA_the_book_df$document_page_id_roman)] 
  
  return(DATA_the_book_df)
  
}
