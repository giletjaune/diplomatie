# INPUT : une url de requête de l'API Gallica
# OUTPUT : une liste de pages. Une page étant constituée d'un vecteur de paragraphes
FUN_single_request_to_gallica_api=function(page_url){
  
  cat("\n1. Downloading page")
  page_html<- read_html(page_url)
  
  cat("\n2. Parsing pages - STEP 1")
  allbodynodes <- page_html %>%
    xml_node('body')
  allnodes <- allbodynodes %>%
    xml_nodes('*')
  allhr <- allbodynodes %>%
    xml_nodes('hr')
  
  cat("\n3. Parsing pages - STEP 2")
  alltext <- allnodes %>%
    html_text(trim = T) %>% 
    as.data.frame(stringsAsFactors = F) %>% 
    select(maintext = '.') %>% 
    mutate(
      ishr = allnodes %in% allhr, 
      page = cumsum(ishr) + 1 
    ) %>%
    filter(!ishr) %>% 
    select(-ishr)
  
  cat("\n4. Putting parsed data into a list")
  alltextlist <- split(alltext$maintext,alltext$page)
  
  return(alltextlist)
}


# INPUT : un vecteur nominatif d'url représentant une requête à l'API Gallica
# OUTPUT : une liste de listes de pages. La liste de sortie est de taille égale au nombre de requêtes.
FUN_multiple_requests_to_gallica_api = function(vector_of_urls){
  resultat = lapply(seq_along(vector_of_urls),function(idx_of_url){
    
    specific_url = vector_of_urls[idx_of_url]
    specific_name = names(specific_url)
    cat("\n     Tome n°",idx_of_url," sur ", length(vector_of_urls)," : ",specific_name)
    result_of_one_request =  FUN_single_request_to_gallica_api(specific_url)
    return(result_of_one_request)
  })
  
  names(resultat) = names(vector_of_urls)
  return(resultat)
}
