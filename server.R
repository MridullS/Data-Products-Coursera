library(shiny)
library(ggplot2)
attach(swiss)

# Define server logic required to draw a histogram
shinyServer(function(input, output) 
    {
    #choosing columns from the dataset
    PlotX <- reactive({
        swiss[, input$AXIS_x]
    })
    
    PlotY <- reactive({
        swiss[, input$AXIS_Y]
    })
    
    # code snippet for the PLOT  
    output$PLOTFINAL <- renderPlot({
        ggplot(data = swiss, aes(x = PlotX(), y = PlotY())) +
            geom_point() + ylab(input$AXIS_Y) +xlab(input$AXIS_x)+
            theme_light()
    })
    
    
})