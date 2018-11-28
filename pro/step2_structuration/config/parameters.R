# parameters


# CORRECTION PARAMETERS * * * * * * 
PARAM_correction_dataframe_list = list()
PARAM_pdf_latin_pagination = list()
TEMP_tome_names = names(DATA_the_book)


# TOME I
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

# Convert to dataframes
PARAM_correction_dataframe = do.call("rbind",PARAM_correction_dataframe_list)