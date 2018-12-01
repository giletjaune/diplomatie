# INPUT : une chaine de caractere qui représente le nom d'un dataframe à modifier
# INPUT : une chaine de caractere qui représente la commande R de l'ajout d'une colonne filter
# OUTPUT : aucune sortie juste le dataframe est augmentée d'une colonne filter maj
add_column_filterto_a_dataframe=function(dfname,string_command){
  if (nchar(string_command)!=0){
    string_command_corrected  = paste0(dfname,"$filter = ",string_command) } else {
      string_command_corrected  = paste0(dfname,"$filter = TRUE")
    }
  eval(expr = parse(text = string_command_corrected),envir = .GlobalEnv)
}


# INPUT : un vecteur de chaine de caracteres
# INPUT : un pattern de regex
# OUTPUT : le vecteur de chaine de caracteres au format HTML avec les match highlited en jaune
FUN_higlight_from_regex = function(text_vector,apattern){
  if (nchar(apattern)!=0){
    res = str_replace_all(string = text_vector,
                          pattern = apattern,
                          replacement = '<span style="background:#FED38D">\\0</span>')} else {
                            res = text_vector
                          }
  
  return(res)
}


# INPUT : un vecteur de chaine de caracteres
# INPUT : un lien url
# OUTPUT : le vecteur de chaine de caractères au format HTML qui contient le lien URL et une anchor link
FUN_format_entete_de_page=function(text_vector,link=""){
  id = tolower(gsub(" ", "", text_vector, fixed = TRUE))
  res = paste0("<hr>","<br/>",
               "<h1><a id = '",
               id,"'></a>",
               text_vector,"<a href =' ",
               link,"'> >>></a>","</h1><br/>")
  
  return (res)
}


# INPUT : un vecteur de chaine de caractères
# INPUT : une couleur en chaine de caractères
# OUPUT : un vecteur de chaine de caractères au format HTML et colorisé
FUN_format_color=function(text_vector,thecolor){
  res = paste0("<span style='color:",thecolor,"'>",text_vector,"</span>")
  return(res)
}


# INPUT : un vecteur de chaine de caractères
# OUTPUT : le vecteur au format HTML encapsulé par le tag p
FUN_format_paragraph=function(text_vector){
  res = paste0("<p>",text_vector,"</p>")
  return(res)
}


# INPUT : un dataframe
# INPUT : une regex pattern
# INPUT : une chaine de caractères représentant un filtre
# OUTPUT : un corpus au format HTML avec les match de la regex highlightés
# et les paragraph hors du filtre en gris clair et des marqueurs clairs de début de page
FUN_build_htmlstring_content = function(df,apattern,string_command=""){
  
  # Filter column creation
  dfname = deparse(substitute(df))
  add_column_filterto_a_dataframe(dfname,string_command)
  
  # Format out of filter paragraph
  df$HTML_object[!df$filter] = FUN_format_color(df$paragraph_value[!df$filter],"#e3e6ea")
  
  # Format in filter paragraph
  df$HTML_object[df$filter] = FUN_higlight_from_regex(df$paragraph_value[df$filter],apattern)
  
  # Metadata content creation
  meta_vector = paste0("[pID:",df$paragraph_id,"]")
  df$HTML_meta = FUN_format_color(meta_vector,"grey")
  
  # Concaténation paragraphes et metadata
  df$HTML_object = FUN_format_paragraph(paste0(df$HTML_object,df$HTML_meta))
  
  # Création des marqueurs de début de page
  to_add_to_the_first_p = FUN_format_entete_de_page(paste0(df$tome_id[df$paragraph_id==1],
                                                           " , page ",
                                                           df$page_id_document[df$paragraph_id==1]),
                                                    link=df$url[df$paragraph_id==1])
  
  # Concaténation des marqueurs de début de page avec les paragraphes
  df$HTML_object[df$paragraph_id==1] = paste0(to_add_to_the_first_p,
                                              df$HTML_object[df$paragraph_id==1])
  
  # Tri et création du HTML final
  solution = paste0(df$HTML_object[order(df$page_id_pdf,df$paragraph_id)],collapse = " ")
  
  return(solution)
}