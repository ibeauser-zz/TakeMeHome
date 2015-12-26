## file server.R
shinyServer(function(input,output,session) {
  observe({
    here.country <- input$here.country
    here.city.choices <- unique(IATA.airports[country == here.country, city])
    updateSelectInput(session, "here.city", choices = c(Choose = '',here.city.choices))
  })
  observe({
    here.city <- input$here.city
    here.airport.choices <- unique(IATA.airports[city == here.city, code])
    updateSelectInput(session, "here.airport", choices = c(Choose = '',here.airport.choices))
  })
  observe({
    home.country <- input$home.country
    home.city.choices <- unique(IATA.airports[country == home.country, city])
    updateSelectInput(session, "home.city", choices = c(Choose = '',home.city.choices))
  })
  observe({
    home.city <- input$home.city
    home.airport.choices <- unique(IATA.airports[city == home.city, code])
    updateSelectInput(session, "home.airport", choices = c(Choose = '',home.airport.choices))
  })
#  observe({
#    here.airport <- input$here.airport
#  })
#  observe({
#    home.airport <- input$home.airport
#  })
  options.data <- eventReactive(input$goButton, {
    here.airport <- input$here.airport
    home.airport <- input$home.airport
    depart.date <- Sys.Date() + 1
    options <- OptionsTable(here = here.airport,home = home.airport,date = depart.date)
    routes <- RoutingTable(options)
    FlightOptions(routes)
#   HTML("<strong> Hello",Sys.Date(), "airport World <strong>")
#   HTML(paste("This sucks\n\ndon't you know"))
  })
  output$flights <- renderUI({HTML(options.data())})
  #output$results <- renderText({options.data()})
  #output$results <- renderPrint({options.data()})
#  output$table <- renderDataTable({options.data()})
  })
