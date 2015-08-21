library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Prediction of Survival on the Titanic"),
  
  sidebarLayout(
    
    sidebarPanel(
      p("Select the categories below to calculate the survival rate on the Titanic:"),
    
      selectInput("class", "Class:", c("1st Class Passenger" = "1st","2nd Class Passenger" = "2nd", "3rd Class Passenger" = "3rd", "Crew Member" = "Crew")),
    
      selectInput("sex", "Sex:",
                c("Male" = "Male", "Female" = "Female")), 
    
      selectInput("age", "Age:",
                c("Children" = "Child", "Adult" = "Adult"))
    ),
    
    mainPanel(tabsetPanel(
        
        tabPanel("Prediction",
                h3("Results of prediction:"),
                h4('You entered...'),
                verbatimTextOutput("oclass"),
                verbatimTextOutput("osex"),
                verbatimTextOutput("oage"),
                h4('...Which results in a prediction of survival of'),
                verbatimTextOutput("survival"),
                p("* Note that this is an estimated probability based on a regression model, that might differ                 from the actual survival rates.")
                
        ),
      
        tabPanel("Documentation",
                 
                h2("Documentation/ Instructions"),
                p("The sinking of the RMS Titanic is one of the most infamous shipwrecks in history.
                   On April 15, 1912, during her maiden voyage, the Titanic sank after colliding with an                          iceberg, killing 1502 out of 2224 passengers and crew. This sensational tragedy shocked the                    international community and led to better safety regulations for ships."),
                p("To use this application, please follow these steps:"),
                p("1. On the selectors on the left, choose the variables 'Class', 'Sex' and 'Age', of the                        passenger profile whose survival rate you want to calculate"), 
                p("2. Make sure your selection criteria have been considered, on the 'You entered...' section                   on the right."),
                p("3. Check the predicted rate of survival obtained according to the model."),
                p("Hope you enjoy this app!")
        )
      ))
)))