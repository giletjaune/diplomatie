# fun


# INPUT : un tome (liste de pages)
# INPUT : le nom de la liste tome
# OUTPUT : un dataframe, chaque ligne un paragraphe mappé vers le tome ID,
# la page ID, le paragraph ID
FUN_single_tome_list_to_dataframe = function(untome,tomename){
  
  nparagraph_by_pagename = sapply(untome,length)
  pagename_vector = rep(x = names(nparagraph_by_pagename),nparagraph_by_pagename)
  sentence_vector = unlist(lapply(nparagraph_by_pagename,seq_len),use.names = FALSE)
  paragraph_vector = unlist(untome)
  tomedf = data.frame("tome_id" = tomename,
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


