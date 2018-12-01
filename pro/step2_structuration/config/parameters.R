# parameters

# Initialisation (automatic) 
PARAM_correction_dataframe_list = list()
PARAM_pdf_latin_pagination = list()
TEMP_tome_names = strsplit(x = names(DATA_the_book),split = "***",fixed = T)[[1]][1]


# Parameters a renseigner : * * * * * * * * * * * * * * * * * * * * * * * *  
PARAM_correction_dataframe_list[[TEMP_tome_names[1]]] = data.frame("tome_id" = TEMP_tome_names[1],
                                                                   "page_id_pdf_correction" = -1,
                                                                   "page_id_document_correction" = -31,
                                                                   "pdf_latin_pagination_start" = 13,
                                                                   "pdf_latin_pagination_end" = 29)

# TOME suivants éventuellement
# ...
# ... 
# ...
# ... 
# ...
# ... 

# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  


# Convert list to dataframe (automatic)
PARAM_correction_dataframe = do.call("rbind",PARAM_correction_dataframe_list)