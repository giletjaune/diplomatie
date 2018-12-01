library(stringr)


# highlight a text vector from a regex
FUN_higlight_from_regex = function(text_vector,apattern){
  res = str_replace_all(string = text_vector,
                  pattern = apattern,
                  replacement = '<span style="background:#FFFF00">\\0</span>')
  return(res)
}



# format un debut de page
FUN_format_entete_de_page(text_vector,link=NA){
  if (is.na(link)) {res = paste0("<hr>","<br/>","<h1>",text_vector,"<h1/><br/>")}
  return (res)
}



# format metadata
FUN_format_color(text_vector){
  res = paste0("<span style='background:grey'>",text_vector,"</span>")
  return(res)
}

# format paragraph
FUN_format_paragraph(text_vector){
  res = paste0("<p>",text_vector,"<p/>")
  return(res)
}

