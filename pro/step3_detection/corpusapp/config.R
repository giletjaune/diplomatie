# Load data
FOLDER_other = dirname(dirname(FOLDER_position))
TEMP_pathfile = paste0(FOLDER_other,"/step2_structuration/data/DATA_the_book_df.rds")
df = readRDS(file = TEMP_pathfile)




# Compute metrics here ====>