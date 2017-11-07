library(shinyIncubator)
library(shiny)
library(ggplot2)
library(psych)

ggplotRegression <- function (fit) {
  require(ggplot2)

  ggplot(fit$model, aes_string(x = names(fit$model)[2], y = names(fit$model)[1])) + 
    geom_point() +
    stat_smooth(method = "lm", col = "red") +
    labs(title = paste("Adj R2 = ",signif(summary(fit)$adj.r.squared, 5),
                       "Intercept =",signif(fit$coef[[1]],5 ),
                       " Slope =",signif(fit$coef[[2]], 5),
                       " P =",signif(summary(fit)$coef[2,4], 5)))
}

  
shinyServer(function(input,output) {

  #Data from matrixInput
  inputData<-reactive({data.frame(x=input$foo[,1],y=input$foo[,2])})
  
  #Linear Regression
  lm1 <- reactive({summary(lm(y~x,data=inputData()))})
  
  output$linreg <- renderPrint({lm1()})
  output$regcoeff <- renderPrint({coef(lm1())[1,1]})
  output$regconst <- renderPrint({coef(lm1())[2,1]})
  output$regcorr <- renderPrint({lm1()$r.squared}) 
  output$linregplot <- renderPlot({ggplotRegression(lm(y~x,data=inputData()))})
  
  #Spearman Correlation
  output$spearcor <- renderPrint({cor.test(x,y,data=inputData(), method="spearman")})
  
  #Phi-Correlation
  output$phicor <- renderPrint({phi(inputData())})
  
})