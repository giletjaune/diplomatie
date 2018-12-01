# On clear la work, on load les librairies, les données et les functions
rm(list=ls())
source(file = "packages.R",encoding = "UTF-8")
source(file = "config.R",encoding = "UTF-8")
source(file = "fun.R",encoding = "UTF-8")


ui <- dashboardPage(
  skin = "blue",
  
  # le DASHBOARD HEADER
  dashboardHeader(title = "Regex Explorer"),
  
  # le DASHBOARD SIDEBAR
  
  dashboardSidebar(
    
    # Quelques options inutiles
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
    ),
    
    # * * * Définition des onglets * * * 
    sidebarMenu(
      menuItem("Explore Corpus", tabName = "ONGLET_draft",icon = icon("book")),
      menuItem("Explore Features", tabName = "ONGLET_offset", icon = icon("table")),
      menuItem("Aide", tabName = "ONGLET_help", icon = icon("info")),

      
      
      # * * * Définition des inputs * * * 
      textInput("selected_regex",
                "Enter a regex",
                value = "[A-Z]"),
      
      textInput("selected_filter",
                "Enter a filter",
                value = "df$paragraph_id %in% c(1,2,3,4)"),
      
      actionButton(inputId = "button_build",label ="Build"),
      
      selectInput(
        inputId = "selected_page_id",
        label = "Go to", 
        choices = unique(df$page_id_document),
        selected = "1",
        selectize = TRUE
      )

    ) # fin de la sidebar menu
  ), # fin de la dashboardsidebar
  
  

  # LE DASHBOARD BODY
  dashboardBody(
    
    # On rajoute avec des style pr rendre le truc cool
    tags$style(type="text/css",
               ".shiny-output-error { visibility: hidden; }",
               ".shiny-output-error:before { visibility: hidden; }"
    ),
    
    
    tabItems(

      
      
      # * * * Debut du 1er onglet * * * 
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
      ), # * * * Fin du premier onglet * * *
      
      
      
      
      
      # * * * Debut du 2nd onlet * * * 
      tabItem(
        tabName = "ONGLET_offset",
        
        # ROW 1 - Onglet offset
        fluidRow(
            box(
              collapsible = TRUE,
              collapsed = FALSE,
              solidHeader = TRUE,
              status = "primary",
              title="Explore Features",
              width=12,
              div(style = 'overflow-x: auto;', dataTableOutput("mytable"))
              
            )

        )
      ), # * * * Fin du second onglet * * * 
      
      
      
      
      
      
      # * * * Debut du 3e onlet * * * 
      tabItem(
        tabName = "ONGLET_help",
        
        # ROW 1 - Onglet offset
        fluidRow(
          box(
            collapsible = TRUE,
            collapsed = FALSE,
            solidHeader = TRUE,
            status = "primary",
            title="Aide",
            width=12,
            includeMarkdown("help.md")
          )
        ),
        fluidRow(
          box(
            collapsible = TRUE,
            collapsed = FALSE,
            solidHeader = TRUE,
            status = "primary",
            title="Stringr Antisèche",
            width=12,
            uiOutput("pdfview2")
          )
        ),
        fluidRow(
          box(
            collapsible = TRUE,
            collapsed = FALSE,
            solidHeader = TRUE,
            status = "primary",
            title="Rstudio Regex Antisèche",
            width=12,
            uiOutput("pdfview")
          )
        )
      ) # * * * Fin du 3e onglet * * * 
      
      
      
      
      

      
      
      
      

    ) # fin de tabitems global
    ) # fin dashboard body
    ) # fin dashboard page
