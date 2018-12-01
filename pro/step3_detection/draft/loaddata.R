# load data file
folder = "C:/Serge/rgx/"
file = "DATA_the_book_df.rds"
pathfile = paste0(folder,file)
df = readRDS(file = pathfile)



# add filter
df$filter = TRUE