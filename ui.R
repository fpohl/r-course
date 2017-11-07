library(shiny)
library(shinyIncubator)
library(ggplot2)
library(psych)

df <- data.frame(matrix(c(1,1),1,2))

shinyUI(pageWithSidebar(
  headerPanel('Statistik Tool by F.P.'),
  sidebarPanel(
    matrixInput('foo', 'Please enter data here', data=df)
  ),
  mainPanel(
    
    tabsetPanel(type = "tabs",
                
                #Pearson-Korrelation
                tabPanel("Pearson-Korrelation",
                         "Regressionskoeffizient b:",
                           verbatimTextOutput(outputId = "regcoeff"),
                         "Regressionskonstante a:",
                           verbatimTextOutput(outputId = "regconst"),
                         "Bestimmtheitsmaß r²",
                           verbatimTextOutput(outputId = "regcorr"),
                          #Gesamt
                          verbatimTextOutput(outputId = "linreg"),
                          #Plot
                          plotOutput("linregplot")
                ),
                
                #Spearman-Korrelation
                tabPanel("Spearman-Korrelation",
                           verbatimTextOutput(outputId = "spearcor")
                        ),
                
                #Vierfelderkorrelation
                tabPanel("Vierfelder-Korrelation",
                           verbatimTextOutput(outputId = "phicor")
                        )
                
    )
  )
)) 