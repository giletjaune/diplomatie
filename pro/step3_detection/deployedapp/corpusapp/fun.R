
# FUN create a filter column
# add a column to a dataframe dfname is a character
add_column_filterto_a_dataframe=function(dfname,string_command){
  if (nchar(string_command)!=0){
    string_command_corrected  = paste0(dfname,"$filter = ",string_command) } else {
      string_command_corrected  = paste0(dfname,"$filter = TRUE")
    }
  # cat(string_command_corrected)
  eval(expr = parse(text = string_command_corrected),envir = .GlobalEnv)
}


# TEST FUN
# string_command = "df$paragraph_id %in% 1"
# add_column_filterto_a_dataframe(dfname = "df",string_command = string_command)




# highlight a text vector from a regex
FUN_higlight_from_regex = function(text_vector,apattern){
  if (nchar(apattern)!=0){
    res = str_replace_all(string = text_vector,
                          pattern = apattern,
                          replacement = '<span style="background:#FFFF00">\\0</span>')} else {
                            res = text_vector
                          }
  return(res)
}




# format un debut de page
FUN_format_entete_de_page=function(text_vector,link=""){
  id = tolower(gsub(" ", "", text_vector, fixed = TRUE))
  res = paste0("<hr>","<br/>","<h1><a id = '",id,"'></a>",text_vector,"<a href =' ",link,"'> >>></a>","</h1><br/>")
  return (res)
}






# format metadata
FUN_format_color=function(text_vector,thecolor){
  # res = paste0("<span style='color:#e3e6ea'>",text_vector,"</span>")
  res = paste0("<span style='color:",thecolor,"'>",text_vector,"</span>")
  return(res)
}

# format paragraph
FUN_format_paragraph=function(text_vector){
  res = paste0("<p>",text_vector,"</p>")
  return(res)
}







# df doit contenir une colonne filter et une colonne url
FUN_build_htmlstring_content = function(df,apattern,string_command=""){
  
  # creation de la filter column 
  dfname = deparse(substitute(df))
  add_column_filterto_a_dataframe(dfname,string_command)
  
  # creation des outfilter
  df$HTML_object[!df$filter] = FUN_format_color(df$paragraph_value[!df$filter],"#e3e6ea")
  
  # creation des infilter
  df$HTML_object[df$filter] = FUN_higlight_from_regex(df$paragraph_value[df$filter],apattern)
  
  # Creation des html metadata
  meta_vector = paste0("[pID:",df$paragraph_id,"]")
  df$HTML_meta = FUN_format_color(meta_vector,"grey")
  
  # concatenation des paragraph et de leur metadata
  df$HTML_object = FUN_format_paragraph(paste0(df$HTML_object,df$HTML_meta))
  
  # creation des html d entetes
  to_add_to_the_first_p = FUN_format_entete_de_page(paste0(df$tome_id[df$paragraph_id==1],
                                                           " , page ",
                                                           df$page_id_document[df$paragraph_id==1]),
                                                    link=df$url[df$paragraph_id==1])
  
  # Concatenation de lentete et du paragraphe 1
  df$HTML_object[df$paragraph_id==1] = paste0(to_add_to_the_first_p,
                                              df$HTML_object[df$paragraph_id==1])
  
  # trier le bordel avant l'impression
  solution = paste0(df$HTML_object[order(df$page_id_pdf,df$paragraph_id)],collapse = " ")
  
  return(solution)
}