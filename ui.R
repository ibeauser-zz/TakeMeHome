## file ui.R

shinyUI(fluidPage(
  headerPanel("", windowTitle = "Take Me Home!"),
  titlePanel("Take Me Home Tomorrow!"),
  fluidRow(
    column(5, "",
           br(),
           fluidRow(
             column(5, "", offset = 0,
                    "I'm leaving HERE:",
                    br(),br(),
                    wellPanel(
                      selectInput("here.country", "Country", choices = c(Choose = '',unique(IATA.airports[, country])), selectize = TRUE),
                      selectInput("here.city", "City", choices = list(), selectize = TRUE),
                      selectInput("here.airport", "Airport", choices = list(), selectize = TRUE)
                    )
             ),
             column(5, "", offset = 0,
                    "for HOME:",
                    br(),br(),
                    wellPanel(
                      selectInput("home.country", "Country", choices = c(Choose = '',unique(IATA.airports[, country])), selectize = TRUE),
                      selectInput("home.city", "City", choices = list(), selectize = TRUE),
                      selectInput("home.airport", "Airport", choices = list(), selectize = TRUE)
                    )
              ),
             fluidRow(
             column(2, "", offset = 0,
                    br(),br(),
                    wellPanel(
                      tags$div(class = "row",
                               tags$div(class = "span", actionButton("goButton", "Go!"),
                                        style = "margin: 1px;"),
                               style = "text-align:center;padding-top: 0px;")
                    )
             ))
           ),
           fluidRow(
                    column(1,"")),
           fluidRow(
             column(9, "", offset = 0,
                    tags$div(class = "row",
                    h5("Help"),
                    helpText("A selection must be made in all of the dropdown boxes in order to get a result. Selecting a Country reduces the set of Cities to be displayed in the next dropdown, and similarly, the City chosen limits the Airport codes available.  Typing direcly in the box is a fast way to search through the list.",br(),br(),"Once the six dropdowns are filled, press the GO button, and wait patiently for your results - it shouldn't be long!",br(),br(),"This is a demonstration app, so proof of concept trumps eye-candy.  Note that the time and currency formats are as exactly returned from the API.  A near term improvement would be to localize and make more readable both those outputs."),
                    style = "padding-left: 40px;")
             )
           )

           ),
    column(7, "",
           br(),
           h4("Flight Options"),
           tags$div(class = "row",
                    tags$div(class = "span", uiOutput(outputId = "flights"),
                             style = "margin: 1px;"),
                    tags$div(class = "span",
                             p("The flights quoted are based on one passenger flying coach, and having no more than two stops along the way.  There may be more options, but this app restricts the number to three.  Also note there are no date choices; the app returns flights scheduled to depart tomorrow.",
                    br(),br(),
                    strong("PRIVACY:")," This app is not coded to store user session information.  However, it is possible that ShinyApps.io does collect and store your data.  Check their ",a(href = "https://www.rstudio.com/about/privacy-policy/","Privacy Policy")," to find out more.",
                    br(),br(),
                    "Although the data supplied by Google is believed to be accurate, do not rely on this application's representation of it when making real travel arrangements.  The author shall not in any way be responsible for losses or damages arising from your use of this application."),
                             style = "font-style: italic;padding: 13px;margin: 10px;border: 1px solid blue;"),
                    style = "text-align:left;padding-top: 10px;padding-right: 8px")
           )
  ),
  hr(),
  tags$div(class = "row",
           tags$div(class = "span",
                    p("Copyright",HTML("&copy;"),"I. Beauser.  All rights reserved."),
                    style = "text-align:center")
                    )
  )
)
