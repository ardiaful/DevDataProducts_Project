library(shiny)
library(datasets)

data(Titanic)
data <- as.data.frame(Titanic)
data_glm <- glm(Survived ~ Class + Sex + Age, binomial, data, data$Freq)

prediction <- function(class, sex, age ){
  input <- c(class, sex, age)
  pdata <- as.data.frame(t(input))
  colnames(pdata) <- c("Class", "Sex", "Age")
  probability <- predict(data_glm,pdata , type = "response" )
  }

shinyServer(
  function(input, output) {
    output$oclass <- renderPrint({input$class})
    output$osex <- renderPrint({input$sex})
    output$oage <- renderPrint({input$age})
    output$survival <- renderText({
      
      paste(round(prediction(input$class,input$sex, input$age)*100, digits= 0), "%", sep="")
            })
  })