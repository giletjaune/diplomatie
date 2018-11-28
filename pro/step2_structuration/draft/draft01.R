DATA_the_book$`Tome I`$`33`


pagepdf = namelist -1




untome = DATA_the_book$`Tome I`
# From tome to dataframe


tomename_vector = "tome I"


# INPUT : une liste tome
# INPUT : le nom de la liste tome
# OUTPUT : un dataframe, chaque ligne un paragraphe mappé vers le tome ID,
# la page ID, le paragraph ID
FUN_tome_list_to_dataframe = function(untome,tomename){
  
  nparagraph_by_pagename = sapply(untome,length)
  pagename_vector = rep(x = names(nparagraph_by_pagename),nparagraph_by_pagename)
  sentence_vector = unlist(lapply(nparagraph_by_pagename,seq_len),use.names = FALSE)
  paragraph_vector = unlist(untome)
  tomedf = data.frame("tome_id" = tomename,
                      "page_id" = pagename_vector,
                      "paragraph_id" = sentence_vector,
                      "paragraph_value" = paragraph_vector)
  
  return(tomedf)
}


xx = FUN_tome_list_to_dataframe(untome,tomename = "tome I")












