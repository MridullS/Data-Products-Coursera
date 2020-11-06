library(shiny)
attach(swiss)
l <- swiss[ , 3:6]
#l <- swiss(c(Education, Infant.Mortality, Agriculture))
m <- swiss[ , 4:6]

# We try to construct a dashboard where we can command the entire operation and move sliders to check for the the factors affecting the graph 
# and set accordingly to help make proper graphs which perform calculations(which is not visible to anyone)

shinyUI(fluidPage(
    titlePanel("Analysis of data for social factors"),   # Heading as appeared on the top ofwebsite as seen in final publication
    
    #----------------------------------------------------------------#
    
# setting of the parameters for the sidepanel which contains the scroller as well which  will help set the binsize for histogram. we also check variables
    sidebarLayout(
        sidebarPanel(
            #Set parameters for scatterplot
            strong('Setting the axes of the PLOT'), 
            p(''),
            selectInput('AXIS_Y', 'Select y axis for scatter plot', 
                        names(l), selected = 'Examination'),
            p(''),
             selectInput('AXIS_x', 'Select x axis for scatter plot', 
                        names(m), selected = 'Catholic')),
        
        #-------------------------------------------------------------#
        
# The following is shown as the way to plot the PLOT which has points scattered along the graph.
      mainPanel(
            p('The following analysis is done for the swiss data with respect to the social
              factors affecting SUISSE society'),
            p(''),
            p('This website elicits the analysis for the four variables on the Y-axis and 
              three variables on X-axis with points plotted along the graph forming a 
              scatter plot with variables which can be changed via sidepanel to see the graph:'),
            plotOutput('PLOTFINAL'),
            p(''),
            p('Variables used above in the drop-down list in the side panel is explained in detail in aS following
'), 
           p('Examination: % draftees receiving highest mark on army examination'),
           p('Education: % education beyond primary school for draftees'),
           p('Catholic: % catholic (as opposed to protestant'),
           p('Infant.Mortality: % live births who live less than 1 year'),
        )
    )
))