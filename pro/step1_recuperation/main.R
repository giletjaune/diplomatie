# Clear the work
rm(list=ls())

# Get the actual location of the actual file (main.R)
FOLDER_position = paste0(dirname(rstudioapi::getSourceEditorContext()$path),"/")

# Load packages
source(paste0(FOLDER_position,"config/packages.R"),encoding = "UTF-8")

# Load parameters
source(paste0(FOLDER_position,"config/parameters.R"),encoding = "UTF-8")

# Load functions
fun_files = list.files(path = paste0(FOLDER_position,"fun"),pattern = "*.R",full.names = T)
lapply(X = fun_files,FUN = function(afile){
  source(file = afile,encoding = "UTF-8")
})


# * * * Execution * * * 
DATA_the_book = FUN_multiple_requests_to_gallica_api(PARAM_urls)


# * * * Sauvegarde * * *
saveRDS(object = DATA_the_book,file = paste0(FOLDER_position,"/data/DATA_the_book.rds"))
