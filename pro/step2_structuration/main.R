# Clear the work
rm(list=ls())

# Get the actual location of the actual file (main.R)
FOLDER_position = paste0(dirname(rstudioapi::getSourceEditorContext()$path),"/")

# Load packages
source(paste0(FOLDER_position,"config/packages.R"),encoding = "UTF-8")

# Load parameters
source(paste0(FOLDER_position,"config/parameters.R"),encoding = "UTF-8")

# Load functions
TEMP_fun_files = list.files(path = paste0(FOLDER_position,"fun"),pattern = "*.R",full.names = T)
lapply(X = TEMP_fun_files,FUN = function(afile){
  source(file = afile,encoding = "UTF-8")
})



# * * * * Execution * * * * #
DATA_the_book_df = FUN_multiple_tome_list_to_dataframe(list_of_tomes = DATA_the_book)
