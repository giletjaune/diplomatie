rm(list=ls())
source(file = "packages.R",encoding = "UTF-8")
source(file = "config.R",encoding = "UTF-8")
source(file = "fun.R",encoding = "UTF-8")


ui <- dashboardPage(
  skin = "blue",
  
  # le DASHBOARD HEADER
  dashboardHeader(title = "Dashboard"),
  
  # le DASHBOARD SIDEBAR
  dashboardSidebar(
    
    
    # les options sidebar
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
    ),
    
    sidebarMenu(
      menuItem("Explore Corpus", tabName = "ONGLET_draft", icon = icon("plane")),
      menuItem("Explore features", tabName = "ONGLET_offset", icon = icon("plane")),

      
      
      #INPUT SELECTOR DE IDs, selected_id
      
      textInput("selected_regex",
                "Enter a regex",
                value = "[A-Z]"),
      
      textInput("selected_filter",
                "Enter a filter",
                value = "df$paragraph_id %in% c(1,2,3,4)"),
      
      actionButton(inputId = "button_build",label ="Build"),
      
      selectInput(
        inputId = "selected_page_id",
        label = "Page", 
        choices = unique(df$page_id_document),
        selected = "1",
        selectize = TRUE
      )

    ) # fin de la sidebar menu
  ), # fin de la dashboardsidebar
  
  

  # LE DASHBOARD BODY
  dashboardBody(
    
    # Les styles
    tags$style(type="text/css",
               ".shiny-output-error { visibility: hidden; }",
               ".shiny-output-error:before { visibility: hidden; }"
    ),
    
    
    tabItems(

      # Debut onglet draft
      tabItem(
        tabName = "ONGLET_draft",
        
        # ROW 1 - Onglet draft
        fluidRow(
          box(
            collapsible = TRUE,
            collapsed = FALSE,
            solidHeader = TRUE,
            status = "primary",
            title="Explore Corpus",
            width=12,
            div(style = 'height: 70vh; overflow-y: auto;', htmlOutput("formattedText"))
          )
        )
      ), # FIN ONGLET draft
      
      
      # Debut onglet offset
      tabItem(
        tabName = "ONGLET_offset",
        
        # ROW 1 - Onglet offset
        fluidRow(
            box(
              collapsible = TRUE,
              collapsed = FALSE,
              solidHeader = TRUE,
              status = "primary",
              title="Explore features",
              width=12,
              div(style = 'overflow-x: auto;', dataTableOutput("mytable"))
              
            )
        )
      ) # FIN ONGLET OFFSET

    ) # fin de tabitems global
    ) # fin dashboard body
    ) # fin dashboard page
