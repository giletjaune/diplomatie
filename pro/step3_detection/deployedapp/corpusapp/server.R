shinyServer(function(input, output, session) {
  
  
  # Valeur reactive qui contient le corpus au format HTML
  # La valeur reactive n'est construite qu'après le click
  # du boutton button_build
  htmlstring <- eventReactive(input$button_build, {
    FUN_build_htmlstring_content(df = df,
                                 apattern = input$selected_regex,
                                 string_command=input$selected_filter)
    },ignoreNULL = FALSE)
  
  
  # Objet text output qui contient la valeur reactive précédemment
  # construite. C'est cet objet qui sera affiché dans l'application
  output$formattedText <- renderText({
    htmlstring()
  })

  
  # Objet datatable output qui contient toutes les features et 
  # metadata du corpus. C'est cet objet qui sera affiché dans l'application
  output$mytable = renderDataTable({
    removecol = c("page_id","paragraph_value","url")
    df[,names(df)[!names(df) %in% removecol]]
  })
  
  
})


