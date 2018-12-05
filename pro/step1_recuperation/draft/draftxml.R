# xml
library(xml2)
library(httr)
library(magrittr)

httr::GET(
  url = "https://gallica.bnf.fr/services/Toc",
  query = list(
    ark = "ark:/12148/bpt6k96718891"
  )
) -> res

doc <- xml_ns_strip(httr::content(res, as="parsed"))
tt = doc[[2]]


xml_find_all(doc, ".//head") %>% 
  xml_text(trim=TRUE)
