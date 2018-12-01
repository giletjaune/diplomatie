shinyServer(function(input, output, session) {
  

  

  
  htmlstring <- eventReactive(input$button_build, {
    FUN_build_htmlstring_content(df = df,
                                 apattern = input$selected_regex,
                                 string_command=input$selected_filter)
  }, ignoreNULL = FALSE)
  
  

  
  output$formattedText <- renderText({
    htmlstring()
  })

  
  output$mytable = renderDataTable({
    removecol = c("page_id","paragraph_value","url")
    df[,names(df)[!names(df) %in% removecol]]
  })
  
  
})


