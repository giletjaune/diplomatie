rm(list=ls())

FOLDER_position = paste0(dirname(rstudioapi::getSourceEditorContext()$path),"/")


source(file = paste0(FOLDER_position,"packages.R"),encoding = "UTF-8")
source(file = paste0(FOLDER_position,"config.R"),encoding = "UTF-8")
source(file = paste0(FOLDER_position,"fun.R"),encoding = "UTF-8")





tt = FUN_build_htmlstring_content(df,apattern="",string_command="")

html_print(HTML(tt,),viewer = "#tomei,page55")


tolower(as.character(as.roman(1)))
