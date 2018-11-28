# Parameters a renseigner : * * * * * * * * * * * * * * * * * * * * * * * *  
PARAM_urls = c("https://gallica.bnf.fr/ark:/12148/bpt6k96718891.texteBrut") 
# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *   


# Nommage des requêtes URLs (automatic)
names(PARAM_urls) = paste0("Tome ",as.character(as.roman(seq(1,length(PARAM_urls)))))
