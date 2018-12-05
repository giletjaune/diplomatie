library(XML)
library(httr)
library(xml2)

identifiant_du_document = "ark:/12148/bpt6k96718891"
base_request = "https://gallica.bnf.fr/services/Toc?ark=" 
api_request = paste0(base_request,identifiant_du_document)
get_volume1 <- GET(api_request)
x = read_xml(get_volume1)

x<-xmlParse(get_volume1)

class(doc)



xml_name(x)


xml_find_all(doc, ".//doc")




choco_xml <- read_xml(api_request,encoding = "latin1")
print(choco_xml)


t = xml_find_all(choco_xml, ".//xref")
a <- xml_children(t)

xml_length(t)


xml_attr(x = choco_xml,attr = "cell")




xml_children()

t = xml_find_all(choco_xml, "/head")
t = xml_children(choco_xml)
xml_length(t)

t =xml_children(xml_children(xml_children(xml_children(xml_children(xml_children(choco_xml))))))




# extract row elements from XML document
row_elements <- xml_find_all(choco_xml, "//row")
length(row_elements)


xml_find_all(row_elements[55],"../*")


retrieve_parent_node_value=function(specific_node){
  parent_of_specific_node = xml_parent(specific_node)
  parent_name = xml_name(parent_of_specific_node)
  
  parent_value = xml_find_all(parent_of_specific_node,paste0(".//",parent_name)) %>%
    xml_text()
  
  return(parent_value)
}




# get parent of a specific node
id_node = 55
specific_node = row_elements[id_node]



specific_node = xml_parent(specific_node)

xml_find_all(specific_node,"./head")
xml_name(specific_node)


xml_child(specific_node)
xml_find_all(parent_of_rowelements,".//table") %>%
  xml_text()

jeanjack = ff[44]
jeanjack = xml_parent(jeanjack)
xml_path(jeanjack)

xml_find_all(jeanjack,".//div2") %>%
  xml_text()






base_elements <- xml_find_all(choco_xml, "//div1/head")

base_elements[2] %>%
  xml_find_all("./head")



dates_elements <- xml_find_all(choco_xml, "//div2/head")
dates_elements %>%
  xml_text(trim = TRUE)

xml_child(month_elements[1])

xml_find_all(, "//div2/head") %>%

xml_name(jeanjack)

tt[[1]]
xml_find_all(ff,"//xref")
yy = xml_parents(ff)
tt = as_list(ff)
tt[[55]]

ff %>%
  xml_text(trim = TRUE)

ff[[5]]

xml_parent(xml_parent(ff[1]))

t %>%
  xml_text(trim=TRUE)


xml_find_all(t,"//head")
xml_ns(t)

xx = xml_structure(t)
xx <- xml_structure(t)

xml_path