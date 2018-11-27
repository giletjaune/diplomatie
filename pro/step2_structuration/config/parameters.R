# parameters



# LOAD DATA * * * * * * * 
TEMP_location_parts = strsplit(x = FOLDER_position,split = "/",fixed = T)[[1]]
FOLDER_root = paste0(TEMP_location_parts[seq(1,length(TEMP_location_parts)-1)],collapse = "/")
DATA_the_book = readRDS(file = paste0(FOLDER_root,"/step1_recuperation/data/DATA_the_book.rds"))



# CORRECTION PARAMETERS * * * * * * 
PARAM_correction_dataframe_list = list()
PARAM_pdf_latin_pagination = list()
TEMP_tome_names = names(DATA_the_book)


# TOME I
PARAM_correction_dataframe_list[[TEMP_tome_names[1]]] = data.frame("tome_id" = TEMP_tome_names[1],
                                                                   "page_id_pdf_correction" = -1,
                                                                   "page_id_document_correction" = -32,
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