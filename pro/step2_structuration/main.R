# Clear the work
rm(list=ls())

# Get the actual location of the actual file (main.R)
FOLDER_position = paste0(dirname(rstudioapi::getSourceEditorContext()$path),"/")

# Load packages
source(paste0(FOLDER_position,"config/packages.R"),encoding = "UTF-8")

# Load functions
TEMP_fun_files = list.files(path = paste0(FOLDER_position,"fun"),pattern = "*.R",full.names = T)
lapply(X = TEMP_fun_files,FUN = function(afile){
  source(file = afile,encoding = "UTF-8")
})

# Load data
TEMP_location_parts = strsplit(x = FOLDER_position,split = "/",fixed = T)[[1]]
FOLDER_root = paste0(TEMP_location_parts[seq(1,length(TEMP_location_parts)-1)],collapse = "/")
DATA_the_book = readRDS(file = paste0(FOLDER_root,"/step1_recuperation/data/DATA_the_book_list.rds"))

# Load parameters
source(paste0(FOLDER_position,"config/parameters.R"),encoding = "UTF-8")





# * * * * Execution * * * * #
DATA_the_book_df = FUN_multiple_tome_list_to_dataframe(list_of_tomes = DATA_the_book)
DATA_the_book_df = FUN_correction_page_arab_id(DATA_the_book_df,PARAM_correction_dataframe)
DATA_the_book_df = FUN_correction_page_latin_id(DATA_the_book_df,PARAM_correction_dataframe)
DATA_the_book_df = DATA_the_book_df[,c("tome_id",
                                       "url_id",
                                       "page_id",
                                       "paragraph_id",
                                       "paragraph_value",
                                       "page_id_pdf",
                                       "page_id_document")]
DATA_the_book_df$url_id = paste0(DATA_the_book_df$url_id,"/f",DATA_the_book_df$page_id_pdf,".image")
DATA_the_book_df$url = DATA_the_book_df$url_id
DATA_the_book_df$url_id = NULL

# * * * Sauvegarde * * *
saveRDS(object = DATA_the_book_df,file = paste0(FOLDER_position,"/data/DATA_the_book_df.rds"))




