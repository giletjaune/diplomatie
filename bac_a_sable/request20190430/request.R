# Erase the work
rm(list=ls())

# Load packages
library(dplyr)
library(tidyr)

# * * * LOAD DATA * * *
# Set meta parameters & load data
filename = "questionsergi.RData"
foldername = "C:/Users/Bar Yokhai/Desktop/projets/Blog/diplomatie/bac_a_sable/request20190430/"
pathile = paste0(foldername,filename)
load(file = pathile)

# * * * PREPARE DATA * * * 
# Convert factors to numeric & Remove accents from columns names
data[2:ncol(data)] <- lapply(data[2:ncol(data)], function(x) as.numeric(as.character(x)))
names(data) = iconv(names(data),from="UTF-8",to="ASCII//TRANSLIT")


# * * * MAIN PART * * * 
# Compute statistics & Reshape statistics
statistics = data %>% 
  group_by(exped) %>% 
  summarise_each(funs(sum))

reshaped_statistics <- statistics %>%
  gather(key = "expediteur",
         value ="mention",
         names(data)[2:ncol(data)])

# * * * CHECK IT OUT * * *
head(reshaped_statistics)

